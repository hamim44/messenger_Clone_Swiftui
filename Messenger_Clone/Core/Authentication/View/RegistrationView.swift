//
//  RegistrationView.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 30/8/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Spacer()
            Image("messenger-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150,height: 150)
                .padding()
            
            VStack(spacing: 12) {
                TextField("Enter your Email", text: $email)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                
                TextField("Enter your Fullname", text: $fullName)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                
                SecureField("Enter your Password", text: $password)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
            }
            
            Button {
               print("Log in")
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                    
            }.padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
               dismiss()
            } label: {
                HStack(spacing: 5) {
                    Text("Already have an Account?")
                    
                    Text("Log In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }.padding(.vertical)
        }
    }
}

#Preview {
    RegistrationView()
}
