//
//  AuthViewModel.swift
//  My Notes
//
//  Created by Ankit Kumar Ojha on 11/03/26.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import Combine

final class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isError: Bool = false
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    
    init() {
        Task {
            await loadCurrentUser()
        }
    }
    
    func loadCurrentUser() async {
        if let user = auth.currentUser {
            userSession = user
            await fetchUser(uid: user.uid)
        }
    }
    
    func login(email: String, password: String) async {
        do {
            let authResult = try await auth.signIn(withEmail: email, password: password)
            userSession = authResult.user
            await fetchUser(uid: authResult.user.uid)
        } catch {
            print(error.localizedDescription)
            isError = true
        }
    }
    
    func fetchUser(uid: String) async {
        do {
            let document = try await db.collection("app")
                .document("my_notes")
                .collection("users")
                .document(uid)
                .getDocument()
            currentUser = try document.data(as: User.self)
        } catch {
            print(error.localizedDescription)
            isError = true
        }
    }
    
    func createUser(name: String, email: String, password: String) async {
        do {
            let authResult = try await auth.createUser(withEmail: email, password: password)
            await storeUserInFirestore(uid: authResult.user.uid, name: name, email: email)
        } catch {
            print(error.localizedDescription)
            isError = true
        }
    }
    
    func storeUserInFirestore(uid: String, name: String, email: String) async {
        let user = User(uid: uid, name: name, email: email)
        do {
            try db.collection("app")
                .document("my_notes")
                .collection("users")
                .document(uid)
                .setData(from: user)
        } catch {
            print(error.localizedDescription)
            isError = true
        }
    }
    
    func signOut() {
        do {
            userSession = nil
            currentUser = nil
            try auth.signOut()
        } catch {
            print(error.localizedDescription)
            isError = true
        }
    }
}
