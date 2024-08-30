//
//  InboxRowView.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 30/8/24.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top,spacing: 12) {
    
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 64, height: 64)
                .foregroundStyle(Color(.systemGray4))
            VStack(alignment:.leading,spacing: 4){
                Text("Abrar Hamim")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Some test messsage for now")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100,alignment: .leading)
            }
            
            HStack {
                Text("Yesterday")
                
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundStyle(.gray)

        }
        .frame(height: 72)
    }
}

#Preview {
    InboxRowView()
}
