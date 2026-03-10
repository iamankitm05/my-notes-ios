//
//  ForgotPasswordView.swift
//  My Notes
//
//  Created by Ankit Kumar Ojha on 10/03/26.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var email: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    InputView(placeholder: "Email", text: $email)
                    
                    Button {
                        
                    } label: {
                        Text("Send")
                    } .buttonStyle(CapsuleButtonStyle())
                }
                .padding()
                .navigationBarTitle("Forgot Password")
            }
        }
    }
}

#Preview {
    ForgotPasswordView()
}
