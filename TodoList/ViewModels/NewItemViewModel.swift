//
//  NewItemViewModel.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init(){}
    
    
    func save(){
        guard canSave else{
            return
        }
        
        //get current user id
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        
        
        //create a model
        let newId = UUID().uuidString
        let newItem = TodoListItem(id: newId, title:title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        
        //save the mode to database
        let db = Firestore.firestore()
        
        db.collection("users").document(uid).collection("todos").document(newId).setData(newItem.asDictionary())
        
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        
        return true
    }
    
}
