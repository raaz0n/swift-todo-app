//
//  TodoListItemViewModel.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// Viewmodel for single to do list of items view (each row in items list)
class TodoListItemViewModel: ObservableObject {
    init(){}
    
    func toggleIsDone(item: TodoListItem){
        var newItem = item
        newItem.setDone(!item.isDone)
        
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
