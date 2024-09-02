//
//  ActiveNowViewModel.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 2/9/24.
//

import Foundation
import Firebase
import FirebaseAuth

class ActiveNowViewModel: ObservableObject {
    @Published var user = [User]()
    
    init(){
        Task { try await fatchUser() }
    }
    
    @MainActor
    private func fatchUser() async throws {
        guard let currentuid = Auth.auth().currentUser?.uid else { return }
        var user = try await UserService.fatchAllUser(limit: 10)
        self.user = user.filter({ $0.id != currentuid})
        
    }
}
