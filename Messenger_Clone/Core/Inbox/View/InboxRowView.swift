//
//  InboxRowView.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 30/8/24.
//

import SwiftUI

struct InboxRowView: View {
    @ObservedObject var ViewModel: InboxViewModel
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
        .swipeActions{
            Button {
                onDelete()
            } label: {
                Image(systemName: "trash")
            }
            .tint(Color(.systemRed))

        }
    }
}

private extension InboxRowView {
    func onDelete() {
        Task { await ViewModel.deleteRecentMessages(message)}
    }
}

//#Preview {
//    InboxRowView()
//}
