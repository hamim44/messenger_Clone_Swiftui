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
    
    private var cancellations = Set<AnyCancellable>()
    
    init(){
        setupSubcribers()
    }
    
    private func setupSubcribers() {
        UserService.shared.$currentUser.sink { user in
            self.currentUser = user
        }.store(in: &cancellations)
    }
}
