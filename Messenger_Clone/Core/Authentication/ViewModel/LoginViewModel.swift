//
//  LoginViewModel.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 31/8/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.logIn(with: email,password: password)
        
    }
    
}
