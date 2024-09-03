//
//  inboxViewModel.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 1/9/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import Combine

@MainActor
class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var recentMessage = [Message]()
    private var service = InboxService()
    
    private var cancellations = Set<AnyCancellable>()
    private var didCompleteInitialLoad = false
    
    init(){
        setupSubcribers()
        service.observeRecentMessgaes()
    }
    
    func deleteRecentMessages(_ message: Message) async {
        do {
            guard let index = self.recentMessage
                .firstIndex(where: { $0.id == message.id }) else { return }
            recentMessage.remove(at: index)
            try await service.deleteConversation(recentMessage: message)
        } catch {
            print("DEBUG: delete error is \(error)")
        }
    }
    
    private func setupSubcribers() {
        UserService.shared.$currentUser.sink {[weak self] user in
            self?.currentUser = user
        }.store(in: &cancellations)
        service.$documentChange.sink { [weak self] changes in
            guard let self else { return }
            
            if didCompleteInitialLoad {
                updateMessagrs(changes)
            } else {
               loadInitialMessage(fromChanges: changes)
            }
        }.store(in: &cancellations)
    }
    
    func loadInitialMessage(fromChanges changes: [DocumentChange]) {
        var messages = changes.compactMap({try? $0.document.data(as: Message.self)})
        
        for i in 0 ..< messages.count {
            let message = messages[i]
            
            UserService.fatchData(withId: message.chatpartnerId) { user in
                messages[i].user = user
                
                self.recentMessage.append(messages[i])
                
                if i == messages.count - 1 {
                    self.didCompleteInitialLoad = true
                }
            }
        }
    }
    
    private func updateMessagrs(_ changes: [DocumentChange]){
        for change in changes {
            if change.type == .added{
                createConversation(change)
            } else if change.type == .modified {
                updateMessagesFromExistingConversation(change)
            }
        }
    }
    
    private func createConversation(_ change: DocumentChange){
        guard var message = try? change.document.data(as: Message.self) else
        { return }
        
        UserService.fatchData(withId: message.chatpartnerId) { user in
            message.user = user
            self.recentMessage.insert(message, at: 0)
        }
    }
    
    private func updateMessagesFromExistingConversation(_ change: DocumentChange){
        guard var message = try? change.document.data(as: Message.self) else
        { return }
        guard let index = self.recentMessage.firstIndex(where: { $0.user?.id == message.chatpartnerId }) else { return }
        message.user = recentMessage[index].user
        
        recentMessage.remove(at: index)
        recentMessage.insert(message, at: 0)
    }
}
