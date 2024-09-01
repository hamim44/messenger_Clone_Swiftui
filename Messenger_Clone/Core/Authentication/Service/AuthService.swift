//
//  AuthService.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 31/8/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static var shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        loadcurrentUserData()
        //     print("DEBUG: current user \(userSession?.uid)")
    }
    
    @MainActor
    func logIn(with email: String,password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            loadcurrentUserData()
            print("DEBUG: user log in")
        } catch {
            print("DEBUG: log in Error is: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String,password: String,fullName:String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
          try await self.uploadData(withemail: email, fullName: fullName, id: result.user.uid)
            loadcurrentUserData()
            print("DEBUG: User Create ")
        } catch {
            print("DEBUG: create Error is: \(error.localizedDescription)")
        }
        
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            print("user sign out")
        } catch {
            print("DEBUG: Sign out error is \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func uploadData(withemail email: String,fullName: String,id:String) async throws {
        let user = User(fullName: fullName, email: email, profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    
    func loadcurrentUserData() {
        Task { try await UserService.shared.fatchcurrentUser() }
    }
}
