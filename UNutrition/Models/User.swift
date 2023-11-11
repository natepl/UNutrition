//
//  User.swift
//  UNutrition
//
//  Created by Nathaniel Parry Luff on 11/11/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let name: String
    let email: String
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, name: "Nate", email: "test@example.com")
}
