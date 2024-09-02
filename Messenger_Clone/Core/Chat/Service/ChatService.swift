//
//  ChatService.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 2/9/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct ChatService {
    
    let chatPartner: User
    
    func sentMessage(_ messageText:String){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let chatpartnerId = chatPartner.id
        
        let currentUserRef = FirebaseConstants.messagecollaction.document(currentUid).collection(chatpartnerId).document()
        let chatpartnerRef = FirebaseConstants.messagecollaction.document(chatpartnerId).collection(currentUid)
        
        let recentCurrentUserRef = FirebaseConstants.messagecollaction.document(currentUid).collection("recent-messages").document(chatpartnerId)
        let recentChatPartnerRef = FirebaseConstants.messagecollaction.document(chatpartnerId).collection("recent-messages").document(currentUid)
        
        
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
        
        recentCurrentUserRef.setData(messageData)
        recentChatPartnerRef.setData(messageData)
    }
    
    
    func obserMessages(completion: @escaping([Message])-> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let chatPartnerId = chatPartner.id
        let query = FirebaseConstants.messagecollaction
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
