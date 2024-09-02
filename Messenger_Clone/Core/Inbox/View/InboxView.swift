//
//  InboxView.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 30/8/24.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
    @StateObject var inboxViewModel = InboxViewModel()
    @State private var selectedUser: User?
    @State private var showChat = false

    
    private var user: User?{
        return inboxViewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
                List {
                    ActiveNow()
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .padding(.vertical)
                        .padding(.horizontal,4)
                    ForEach(inboxViewModel.recentMessage) {
                        message in
                        
                        ZStack {
                            NavigationLink(value: message) {
                                EmptyView()
                            }.opacity(0.0)
                            InboxRowView(message: message)
                        }
                    }
                }
            .listStyle(PlainListStyle())
            .onChange(of: selectedUser, {oldvalue ,newvalue in
                showChat = newvalue != nil
            })
            .navigationDestination(for: Message.self, destination: { message in
                if let user = message.user {
                    ChatView(user: user)
                }
            })
            .navigationDestination(isPresented: $showChat, destination: {
                if let user = selectedUser {
                    ChatView(user: user)
                }
            })
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView(selecteduser: $selectedUser)
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
                        selectedUser = nil
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
