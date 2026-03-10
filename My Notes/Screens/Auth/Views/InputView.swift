//
//  InputView.swift
//  My Notes
//
//  Created by Ankit Kumar Ojha on 08/03/26.
//

import SwiftUI

struct InputView: View {
    let placeholder: String
    let isSecureField: Bool
    @Binding var text: String
    
    init(placeholder: String, isSecureField: Bool = false, text: Binding<String>) {
        self.placeholder = placeholder
        self.isSecureField = isSecureField
        self._text = text
    }
    
    var body: some View {
        if isSecureField {
            SecureField(placeholder, text: $text)
        } else {
            TextField(placeholder, text: $text)
        }
        Divider()
    }
}

#Preview {
    InputView(placeholder: "Email", text: .constant(""))
}
