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
    let user : User
    
    init(user: User) {
        self.user = user
        observeMessages()
    }
    
    func messageText() {
        MessageService.sentMessage(massageText, toUser: user)
    }
    
    func observeMessages(){
        MessageService.obserMessages(chatPartner: user) { messages in
           self.messages.append(contentsOf: messages)
        }
    }
}

