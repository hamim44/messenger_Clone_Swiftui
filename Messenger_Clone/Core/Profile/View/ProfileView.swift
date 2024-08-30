//
//  ProfileView.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 30/8/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color(.systemGray4))
                
                Text("Abrar Hamim")
                    .font(.title2)
                    .fontWeight(.semibold)
                
            }
            
            List {
                Section {
                    ForEach(SettingOptionViewModel.allCases,id: \.self){ option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(option.imageBackgroundColor)
                            
                            Text(option.title)
                                .font(.subheadline)
                        }
                    }
                }
                
                Section {
                    Button("Log Out",role: .destructive) {
                        
                    }
                    
                    Button("Delete Account",role: .destructive) {
                        
                    }
                    
                }
            }
        }

    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
