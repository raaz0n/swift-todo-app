//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import Foundation
import FirebaseFirestore

/// Viewmodel for list of items view
/// Primary tab
class TodoListViewModel: ObservableObject {
    @Published var showNewItemView = false
    private let userId: String
    init(userId: String){
        self.userId = userId
    }
    
    
    func delete(id: String){
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
