//
//  ChatView.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 31/8/24.
//

import SwiftUI

struct ChatView: View {
    @State private var massageText = ""
    let user: User
    var body: some View {
        VStack {
            ScrollView {
                
                VStack{
                    CircularprofileView(user: User.MockUser, size: .xLarge)
                    
                    VStack(spacing: 2) {
                        Text(user.fullName)
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text("Messenger")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.gray))
                        
                    }
                }
                
                ForEach(0...1000,id: \.self) { message in
                    ChatMessageCell(iscurrentUser: Bool.random())
                        
                    
                }
            }
            Spacer()
            ZStack(alignment: .trailing) {
                TextField("Message...", text: $massageText,axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 72)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                
                
                Button {
                    print("Send Meassage")
                } label: {
                    HStack(spacing: 5) {
                        Text("Send")
                            .font(.subheadline)
                        .fontWeight(.semibold)
                        
                        Image(systemName: "paperplane.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    .autocorrectionDisabled()
                    
                    
                }
                
                .padding()
                
            }
            .padding()
        }
    }
}


#Preview {
    ChatView(user: User.MockUser)
}
