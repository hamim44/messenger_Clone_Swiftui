//
//  Message.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 1/9/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct Message: Identifiable,Hashable,Codable {
    @DocumentID var messageID: String?
    let fromId:String
    let toId:String
    let messageText:String
    let timestamp: Timestamp
    
    var user: User?
    
    var id: String {
        return messageID ?? NSUUID().uuidString
    }
    
    var chatpartnerId: String {
        return fromId ==  Auth.auth().currentUser?.uid ? toId : fromId
    }
    
    var isFromCurrentUser: Bool {
        return fromId ==  Auth.auth().currentUser?.uid 
    }
    
}
