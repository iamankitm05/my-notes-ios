//
//  AuthViewModel.swift
//  My Notes
//
//  Created by Ankit Kumar Ojha on 11/03/26.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var user: User?
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    
    init() {
        
    }
    
    
}
