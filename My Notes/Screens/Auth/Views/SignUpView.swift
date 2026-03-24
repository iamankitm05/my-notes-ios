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
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var router: LoginFlowRouter
    
    
    var isValidPassword: Bool {
        password == confirmPassword
    }
    
    var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    InputView(placeholder: "Name*", text: $name)
                    InputView(placeholder: "Email*", text: $email)
                    InputView(placeholder: "Password*",
                              isSecureField: true,
                              text: $password)
                    ZStack(alignment: .trailing) {
                        InputView(placeholder: "Password Confirmation*",
                                  isSecureField: true,
                                  text: $confirmPassword)
                        Image(systemName: "\(isValidPassword ? "checkmark" : "xmark").circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(
                                isValidPassword ? Color(.systemGreen) : Color(.systemRed)
                            )
                    }
                    
                    Button {
                        Task {
                            await authViewModel.createUser(
                                name: name,
                                email: email,
                                password: password)
                        }
                    } label: {
                        Text("Sign Up")
                    } .buttonStyle(CapsuleButtonStyle())
                }
                .padding()
                .navigationBarTitle("Sign Up")
            }
        
    }
}

#Preview {
    SignUpView()
        .environmentObject(AuthViewModel())
}
