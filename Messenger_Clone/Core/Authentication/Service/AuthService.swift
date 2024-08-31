//
//  AuthService.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 31/8/24.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static var shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
  //     print("DEBUG: current user \(userSession?.uid)")
    }
    
    func logIn(with email: String,password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: user log in")
        } catch {
            print("DEBUG: log in Error is: \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String,password: String,fullName:String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
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
}
