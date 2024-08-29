//
//  LogInView.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 30/8/24.
//

import SwiftUI

struct LogInView: View {
    @State private var email: String = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            
            VStack {
                Spacer()
                Image("messenger-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150,height: 150)
                    .padding()
                
                VStack(spacing: 12) {
                    TextField("Enter you Email", text: $email)
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
                    print("Forget Button")
                }label: {
                    Text("Forget Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing,28)
                        
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                
                Button {
                   print("Log in")
                } label: {
                    Text("Log in")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                        
                }.padding(.vertical)
                
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2)-40,height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2)-40,height: 0.5)
                }.foregroundStyle(.gray)
                
                HStack {
                    Image("facebook-logo")
                        .resizable()
                        .frame(width: 20, height: 20)
                        
                    Text("Continue With Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                }
                .padding(.top ,8)
                
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack {
                        Text("Don't have an Account?")
                        
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }.padding(.vertical)



                
            }
        }
        
    }
}

#Preview {
    LogInView()
}
