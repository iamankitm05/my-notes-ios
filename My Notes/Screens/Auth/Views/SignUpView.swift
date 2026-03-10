//
//  SignUpView.swift
//  My Notes
//
//  Created by Ankit Kumar Ojha on 10/03/26.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    InputView(placeholder: "Name*", text: $name)
                    InputView(placeholder: "Email*", text: $email)
                    InputView(placeholder: "Password*", text: $password)
                    InputView(placeholder: "Password Confirmation*", text: $confirmPassword)
                    
                    Button {
                        
                    } label: {
                        Text("Sign Up")
                    } .buttonStyle(CapsuleButtonStyle())
                }
                .padding()
                .navigationBarTitle("Sign Up")
            }
        }
    }
}

#Preview {
    SignUpView()
}
