//
//  RegistrationViewModel.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 31/8/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var fullName = ""
    @Published var password = ""
    
    func registration() async throws {
        try await  AuthService.shared.createUser(withEmail: email, password: password, fullName: fullName)
    }
    
    
}
