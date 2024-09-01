//
//  MessageService.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 1/9/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore


struct MessageService {
    
    static let messagecollaction = Firestore.firestore().collection("messages")
    
    static func sentMessage(_ messageText:String,toUser user : User){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let chatpartnerId = user.id
        let currentUserRef = messagecollaction.document(currentUid).collection(chatpartnerId).document()
        let chatpartnerRef = messagecollaction.document(chatpartnerId).collection(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let message = Message(
            messageID: messageId,
            fromId: currentUid,
            toId: chatpartnerId,
            messageText: messageText,
            timestamp: Timestamp()
        )
        
        guard let messageData  = try? Firestore.Encoder().encode(message) else { return }
        currentUserRef.setData(messageData)
        chatpartnerRef.document(messageId).setData(messageData)
        
    }
    
    
    static func obserMessages(chatPartner:User ,completion: @escaping([Message])-> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let chatPartnerId = chatPartner.id
        let query = messagecollaction
            .document(currentUid)
            .collection(chatPartnerId)
            .order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshort, _ in
            guard let changes = snapshort?.documentChanges.filter({ $0.type == .added}) else {return}
            var messages = changes.compactMap({try? $0.document.data(as: Message.self)})
            
            for(index,message) in messages.enumerated() where message.fromId != currentUid {
                messages[index].user = chatPartner
            }
            completion(messages)
        }
    }
}
