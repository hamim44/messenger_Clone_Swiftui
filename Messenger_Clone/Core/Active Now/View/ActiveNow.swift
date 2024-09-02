//
//  ActiveNow.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 30/8/24.
//

import SwiftUI

struct ActiveNow: View {
    @StateObject var activeViewModel = ActiveNowViewModel()
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 32) {
                ForEach(activeViewModel.user) { user in
                    NavigationLink(value: Route.ChatView(user)) {
                        VStack{
                            ZStack(alignment:.bottomTrailing) {
                                CircularprofileView(user: user, size: .large)
                                
                                ZStack {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 18, height: 18)
                                       
                                    Circle()
                                        .fill(.green)
                                        .frame(width: 12, height: 12)
                                }
                            }
                            Text(user.firstName)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }

                }
            }
            .padding()
        }
        .frame(height: 90)
    }
}

#Preview {
    ActiveNow()
}
