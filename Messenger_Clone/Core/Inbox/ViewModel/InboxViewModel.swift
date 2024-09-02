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

class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var recentMessage = [Message]()
    private var service = InboxService()
    
    private var cancellations = Set<AnyCancellable>()
    
    init(){
        setupSubcribers()
        service.observeRecentMessgaes()
    }
    
    private func setupSubcribers() {
        UserService.shared.$currentUser.sink {[weak self] user in
            self?.currentUser = user
        }.store(in: &cancellations)
        service.$documentChange.sink { [weak self] changes in
            self?.loadInitialMessage(fromChanges: changes)
        }.store(in: &cancellations)
    }
    
    func loadInitialMessage(fromChanges changes: [DocumentChange]) {
        var messages = changes.compactMap({try? $0.document.data(as: Message.self)})
        
        for i in 0 ..< messages.count {
            let message = messages[i]
            
            UserService.fatchData(withId: message.chatpartnerId) { user in
                messages[i].user = user
                
                self.recentMessage.append(messages[i])
            }
        }
    }
}
