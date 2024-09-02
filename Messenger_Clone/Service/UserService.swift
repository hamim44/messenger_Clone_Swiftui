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
    
    @MainActor
    func fatchcurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("DEBUG: Current user is \(String(describing: currentUser))")
    }
    
    
    static func fatchAllUser(limit: Int? = nil) async throws ->[User] {
        let query = FirebaseConstants.usercollaction
        if let limit { query.limit(to: limit) }
        let snapshot = try await query.getDocuments()
        let users = snapshot.documents.compactMap({try? $0.data(as: User.self)})
        return users
    }
    
    static func fatchData(withId uid:String, Completion: @escaping(User)-> Void){
        FirebaseConstants.usercollaction.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            Completion(user)
        }
       
    }
    
}
