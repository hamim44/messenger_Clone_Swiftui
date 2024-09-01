//
//  UserService.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 1/9/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class UserService {
    
    @Published var currentUser: User?
    
    static var shared = UserService()
    
    func fatchcurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("DEBUG: Current user is \(currentUser)")
        
    }
    
}
