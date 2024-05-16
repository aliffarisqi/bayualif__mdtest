//
//  ContentView.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil{
                HomeView()
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
