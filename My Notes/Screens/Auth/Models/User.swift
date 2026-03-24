//
//  User.swift
//  My Notes
//
//  Created by Ankit Kumar Ojha on 11/03/26.
//

import Foundation

struct User: Codable {
    var uid: String
    var name: String
    var email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: name) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return "NA"
    }
}
