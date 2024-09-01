//
//  containViewModel.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 31/8/24.
//

import Foundation
import Firebase
import FirebaseAuth
import Combine

class ContainViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    private var cancelables = Set<AnyCancellable>()
    
    init() {
        Task { setupSubcription() }
    }
    
    func setupSubcription() {
        AuthService.shared.$userSession.sink { [weak self] userSessiontoAuth in
            self?.userSession = userSessiontoAuth
        }.store(in: &cancelables)
    }
    
}
