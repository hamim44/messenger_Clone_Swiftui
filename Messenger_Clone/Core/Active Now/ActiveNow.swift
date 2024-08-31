//
//  ActiveNow.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 30/8/24.
//

import SwiftUI

struct ActiveNow: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 32) {
                ForEach(0...10,id: \.self) { user in
                    VStack{
                        ZStack(alignment:.bottomTrailing) {
                            CircularprofileView(user: User.MockUser, size: .large)
                            
                            ZStack {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 18, height: 18)
                                   
                                Circle()
                                    .fill(.green)
                                    .frame(width: 12, height: 12)
                            }
                        }
                        Text("Hamim")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
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
