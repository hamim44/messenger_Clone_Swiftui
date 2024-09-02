//
//  User.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 31/8/24.
//

import Foundation
import FirebaseFirestore


struct User: Codable,Identifiable,Hashable {
    @DocumentID var uid: String?
    let fullName: String
    let email: String
    var profileImageUrl: String?
    
    var id: String {
        return  uid ?? NSUUID().uuidString
    }
    
    var firstName: String {
        let formatter = PersonNameComponentsFormatter()
        let component = formatter.personNameComponents(from: fullName)
        return component?.givenName ?? fullName
    }
    
}

extension User {
    static let MockUser = User (fullName: "Ryan Reynolds", email: "deadpool@gmail.com", profileImageUrl: "deadpool")
}
