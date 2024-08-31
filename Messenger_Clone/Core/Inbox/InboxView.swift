//
//  InboxView.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 30/8/24.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
    @State private var user = User.MockUser
    var body: some View {
        NavigationStack {
            ScrollView {
                ActiveNow()
                    .navigationBarTitleDisplayMode(.inline)
                
                List {
                    ForEach(0...20,id: \.self) {
                        message in
                        InboxRowView()
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 120)
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView()
            })
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    HStack(spacing: 4) {
                        NavigationLink(value: user) {
                            CircularprofileView(user: user, size: .xSmall)
                        }
                        
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showNewMessageView.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black,Color(.systemGray5))
                    }
                    
                        
                }
            }
        }
    }
}

#Preview {
    InboxView()
}
