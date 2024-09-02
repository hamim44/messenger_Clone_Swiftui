//
//  InboxRowView.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 30/8/24.
//

import SwiftUI

struct InboxRowView: View {
    let message :  Message
    var body: some View {
        HStack(alignment: .top,spacing: 12) {
    
            CircularprofileView(user: message.user, size: .large)
            VStack(alignment:.leading,spacing: 4){
                Text(message.user?.fullName ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(message.messageText)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100,alignment: .leading)
            }
            
            HStack {
                Text(message.timestampString)
                
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundStyle(.gray)

        }
        .frame(height: 72)
    }
}

//#Preview {
//    InboxRowView()
//}
