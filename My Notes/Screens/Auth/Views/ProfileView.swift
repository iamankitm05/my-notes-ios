//
//  ProfileView.swift
//  My Notes
//
//  Created by Ankit Kumar Ojha on 14/03/26.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack(spacing: 16) {
                        Text("AK")
                            .font(Font.title)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(.white))
                            .frame(width: 70, height: 70)
                            .background(Color(.lightGray))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Ankit Kumar")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("ankit@yopmail.com")
                        }
                    }
                }
                
                Section("Accounts") {
                    Button {
                        authViewModel.signOut()
                    } label: {
                        Label {
                            Text("Sign Out")
                        } icon: {
                            Image(systemName: "arrow.left.circle.fill")
                        }
                    }
                    Button {
                        authViewModel.signOut()
                    } label: {
                        Label {
                            Text("Sign Out")
                        } icon: {
                            Image(systemName: "arrow.left.circle.fill")
                        }
                    }
                }
                
            }
            .navigationTitle(Text("Profile"))
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
