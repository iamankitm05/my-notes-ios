//
//  ContentView.swift
//  My Notes
//
//  Created by Ankit Kumar Ojha on 08/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var authViewModel: AuthViewModel = .init()
    @StateObject private var loginFlowRouter = LoginFlowRouter()
    
    
    var body: some View {
        Group {
            if authViewModel.userSession != nil {
                NotesListView()
            } else {
                loginFlowView
            }
        }
        .environmentObject(authViewModel)
    }
    
    var loginFlowView: some View {
        NavigationStack(path: $loginFlowRouter.navPaths) {
            LoginView()
                .navigationDestination(for: LoginFlow.self) {
                    destination in
                    destination.destinationView
                        .navigationTitle(destination.title)
                }
        }
        .environmentObject(loginFlowRouter)
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
