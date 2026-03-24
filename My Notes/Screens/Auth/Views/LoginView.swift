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
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var router : LoginFlowRouter
    
    var body: some View {
           ScrollView {
               VStack(spacing: 20) {
                   InputView(placeholder: "Email", text: $email)
                   InputView(placeholder: "Password",
                             isSecureField: true,
                             text: $password)
                   
                   HStack {
                       Spacer()
                       
                       Button {
                           router.navigate(to: .forgetPassword)
                       } label: {
                           Text("Forgot Password?")
                       }
                       
                   }
                   
                   Button {
                       Task {
                           await authViewModel.login(email: email, password: password)
                       }
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
                       Task {
                           await authViewModel.login(email: email, password: password)
                       }
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
                       Button {
                           router.navigate(to: .signUp)
                       } label: {
                           Text("Sign up")
                       }
                   }
                   
                   Spacer()
                   
               }
               .navigationTitle("Login")
               .padding()
               .alert("Something went wrong!", isPresented: $authViewModel.isError) {}
            }
        }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
