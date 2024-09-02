//
//  Constants.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 2/9/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct FirebaseConstants {
    static let messagecollaction = Firestore.firestore().collection("messages")
    static let usercollaction = Firestore.firestore().collection("users")
}
