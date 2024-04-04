//
//  TodoListApp.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import FirebaseCore
import SwiftUI

@main
struct TodoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        
        }
    }
}
