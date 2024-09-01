//
//  ChatMessageCell.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 31/8/24.
//

import SwiftUI

struct ChatMessageCell: View {
    let message: Message
    
    var isFromCurrentUser: Bool {
        return message.isFromCurrentUser
    }
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
                Text(message.messageText)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundStyle(.white)
                    .clipShape(ChatBubble(isCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5,alignment: .trailing)
                
            } else {
                HStack(alignment: .bottom,spacing: 4) {
                    CircularprofileView(user: User.MockUser, size: .xxSmall)
                    
                    Text(message.messageText)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray4))
                        .foregroundStyle(.black)
                        .clipShape(ChatBubble(isCurrentUser: isFromCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75,alignment: .leading)
                    Spacer()
                    
                }
            }
        }
        .padding(.horizontal,8)
    }
}
//
//#Preview {
//    ChatMessageCell(isFromcurrentUser: false)
//}
