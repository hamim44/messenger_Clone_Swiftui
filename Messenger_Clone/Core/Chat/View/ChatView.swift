//
//  ChatView.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 31/8/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject var ChatViewModel:chatViewModel
   let user: User
    
    init(user: User) {
        self.user = user
        self._ChatViewModel = StateObject(wrappedValue: chatViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            ScrollView {
                
                VStack{
                    CircularprofileView(user: user, size: .xLarge)
                    
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
                LazyVStack{
                    ForEach(ChatViewModel.messages) { message in
                        ChatMessageCell(message: message)
                        
                    }
                }
            }
            Spacer()
            ZStack(alignment: .trailing) {
                TextField("Message...", text: $ChatViewModel.massageText,axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 72)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(.horizontal,12)
                
                
                Button {
                    ChatViewModel.sendMessgae()
                    ChatViewModel.massageText = ""
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
            .navigationTitle(user.fullName)
            .navigationBarTitleDisplayMode(.inline)
            .padding(.vertical,5)
           
        }
    }
}


#Preview {
    ChatView(user: User.MockUser)
}
