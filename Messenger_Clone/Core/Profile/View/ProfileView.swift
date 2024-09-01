//
//  ProfileView.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 30/8/24.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var user: User
    var body: some View {
        VStack {
            VStack {
                PhotosPicker(selection: $viewModel.selectedItem) {
                    if let profileImage = viewModel.profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } else  {
                        CircularprofileView(user: user, size: .xLarge)
                    }
                }
                
                Text(user.fullName)
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
                        AuthService.shared.signOut()
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
        ProfileView(user: User.MockUser)
    }
}
