//
//  User.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import Foundation

struct User: Codable{
    let id: String
    let fullname: String
    let email: String
    let joined: TimeInterval
}
