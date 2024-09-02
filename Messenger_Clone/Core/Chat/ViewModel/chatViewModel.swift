//
//  chatViewModel.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 2/9/24.
//

import Foundation

class chatViewModel: ObservableObject {
    
    @Published var massageText = ""
    @Published var messages = [Message]()
    let service: ChatService
    
    init(user: User) {
        self.service = ChatService(chatPartner: user)
        observeMessages()
    }
    
    func sendMessgae() {
        service.sentMessage(massageText)
    }
    
    func observeMessages(){
        service.obserMessages() { messages in
            self.messages.append(contentsOf: messages)
        }
    }
}

