//
//  ContentView.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 30/8/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContainViewModel()
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                InboxView()
            } else  {
                LogInView()
            }
        }
    }
}

#Preview {
    ContentView()
}
