//
//  Users.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 15/05/24.
//

import Foundation

struct User: Identifiable, Codable{
    let id: String
    let fullName: String
    let email: String
    let isEmailVerified: Bool
    
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

extension User{
    static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "Jaka Sembung", email: "jaka@gmail.com", isEmailVerified: false)
}
