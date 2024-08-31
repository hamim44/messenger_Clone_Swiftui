//
//  User.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 31/8/24.
//

import Foundation

struct User: Codable,Identifiable,Hashable {
    var id = UUID().uuidString
    let fullName: String
    let emil: String
    var profileImageUrl: String?
}

extension User {
 static let MockUser = User(fullName: "Ryan Reynolds", emil: "deadpool@gmail.com", profileImageUrl: "deadpool")
}
