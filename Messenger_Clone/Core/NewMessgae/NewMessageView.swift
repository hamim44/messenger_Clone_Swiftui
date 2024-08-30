//
//  NewMessageView.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 30/8/24.
//

import SwiftUI

struct NewMessageView: View {
    @State private var search = ""
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
                
                ForEach(0...10,id: \.self) { user in
                    VStack{
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 44, height: 44)
                                .foregroundStyle(Color(.systemGray4))
                            
                            Text("jahir Raihan".capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        
                        Divider()
                            .padding(.leading,50)
                        
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

        NewMessageView()
    
}
