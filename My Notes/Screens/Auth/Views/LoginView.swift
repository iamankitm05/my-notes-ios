//
//  LoginView.swift
//  My Notes
//
//  Created by Ankit Kumar Ojha on 08/03/26.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack {
           ScrollView {
               VStack(spacing: 20) {
                   InputView(placeholder: "Email", text: $email)
                   InputView(placeholder: "Password",
                             isSecureField: true,
                             text: $password)
                   
                   HStack {
                       Spacer()
                       NavigationLink(destination: ForgotPasswordView()) {
                           Text("Forgot Password?")
                       }
                       
                   }
                   
                   Button {
                       
                   } label: {
                       Text("Continue")
                   }
                   .buttonStyle(CapsuleButtonStyle())
                   
                   HStack {
                       VStack {Divider()}
                       Text(" Or ")
                       VStack {Divider()}
                   }
                   
                   Button {
                       
                   } label: {
                       HStack {
                           Image("google")
                               .resizable()
                               .frame(width: 24, height: 24)
                           Text("Sign in with Google")
                       }
                   }
                   .buttonStyle(CapsuleButtonStyle(bgColor: Color(.white),
                                                   textColor: Color(.secondaryLabel),
                                                   hasBorder: true))
                   
                   HStack {
                       Text("Don't have an account? ")
                       NavigationLink(destination: SignUpView()) {
                           Text("Sign up")
                       }
                   }
                   
                   Spacer()
                   
               }
               .navigationTitle("Login")
               .padding()
            }
        }    }
}

#Preview {
    LoginView()
}
