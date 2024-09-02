//
//  InboxService.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 2/9/24.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

class InboxService {
    @Published var documentChange = [DocumentChange]()
    
    func observeRecentMessgaes() {
        guard let uid = Auth.auth().currentUser?.uid else { return}
        
        let query = FirebaseConstants
            .messagecollaction
            .document(uid)
            .collection("recent-messages")
            .order(by: "timestamp",descending: false)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?
                .documentChanges
                .filter({$0.type == .added || $0.type == .modified}) else { return }
            self.documentChange = changes
        }
    }
}
