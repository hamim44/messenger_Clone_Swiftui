//
//  ChatMessageCell.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 31/8/24.
//

import SwiftUI

struct ChatMessageCell: View {
    let  iscurrentUser: Bool
    var body: some View {
        HStack {
            if iscurrentUser {
                Spacer()
                Text("This is test message noe, this is longer message to show what happend")
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundStyle(.white)
                    .clipShape(ChatBubble(isCurrentUser: iscurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5,alignment: .trailing)
                
            } else {
                HStack(alignment: .bottom,spacing: 4) {
                    CircularprofileView(user: User.MockUser, size: .xxSmall)
                    
                    Text("This is code test and work with thisthis is longer message to show what happend")
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray4))
                        .foregroundStyle(.black)
                        .clipShape(ChatBubble(isCurrentUser: iscurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75,alignment: .leading)
                    Spacer()
                    
                }
            }
        }
        .padding(.horizontal,8)
    }
}

#Preview {
    ChatMessageCell(iscurrentUser: false)
}
