//
//  ChatBubble.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 31/8/24.
//

import SwiftUI

struct ChatBubble: Shape {
    let isCurrentUser: Bool
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [
                                    .topRight,
                                    .topLeft,
                                    isCurrentUser ? .bottomLeft : .bottomRight
                                ],
                                cornerRadii: CGSize(width: 16, height: 16))
        return Path(path.cgPath)
        
    }
}

#Preview {
    ChatBubble(isCurrentUser: true)
}
