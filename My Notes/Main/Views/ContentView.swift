//
//  ContentView.swift
//  My Notes
//
//  Created by Ankit Kumar Ojha on 08/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var authViewModel: AuthViewModel = .init()
    @StateObject private var loginFlowRouter = LoginFlowRouter()
    @StateObject private var myNotesFlowRouter = MyNotesFlowRouter()
    
    
    var body: some View {
        Group {
            if authViewModel.userSession != nil, authViewModel.currentUser != nil {
                myNotesFlowView
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
    
    var myNotesFlowView: some View {
        NavigationStack(path: $myNotesFlowRouter.navPaths) {
            NotesListView()
                .navigationDestination(for: MyNotesFlow.self) {
                    destination in
                    destination.destinationView
                        .navigationTitle(destination.title)
                }
        }
        .environmentObject(myNotesFlowRouter)
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
