//
//  Route.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 2/9/24.
//

import Foundation

enum Route: Hashable {
    case ProfileView(User)
    case ChatView(User)
}
