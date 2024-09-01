//
//  NewMessageView.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 30/8/24.
//

import SwiftUI

struct NewMessageView: View {
    @State private var search = ""
    @StateObject var newMessageViewModel = NewMessageViewModel()
    @Binding var selecteduser:User?
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("To: ", text: $search)
                    .fontWeight(.semibold)
                    .frame(height: 42)
                    .padding(.horizontal)
                    .background(Color(.systemGroupedBackground))
                
                Text("Contacts")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                
                ForEach(newMessageViewModel.users) { user in
                    VStack{
                        HStack {
                            CircularprofileView(user: user, size: .medium)
                            
                            
                            Text(user.fullName.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        
                        Divider()
                            .padding(.leading,50)
                        
                    }
                    .onTapGesture {
                        selecteduser = user
                        dismiss()
                    }
                }
                
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancal") {
                        dismiss()
                    }
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
//                    Button {
//                        dismiss()
//                    } label: {
//                        Image(systemName: "chevron.left")
//                            .resizable()
//                            .frame(width: 12, height: 12)
//                            .foregroundStyle(.black)
//                            .fontWeight(.semibold)
//                    }

                }
            }
        }
    }
}

#Preview {

    NewMessageView(selecteduser: .constant(User.MockUser))
    
}
