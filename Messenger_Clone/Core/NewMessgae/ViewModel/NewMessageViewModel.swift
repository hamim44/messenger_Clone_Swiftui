//
//  NewMessageViewModel.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 1/9/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

@MainActor
class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init(){
        Task { try await fatchUsers() }
    }
    
    func fatchUsers() async throws {
        guard let currentUser = Auth.auth().currentUser?.uid else { return }
        let users = try await UserService.fatchAllUser()
        self.users = users.filter({$0.id != currentUser })
    }
}
