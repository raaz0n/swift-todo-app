//
//  TodoListItem.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import Foundation

struct TodoListItem: Codable, Identifiable{
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
        
    }

    
}

