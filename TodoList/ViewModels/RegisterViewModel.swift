//
//  RegisterViewModel.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore



class RegisterViewModel: ObservableObject{
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(fullName: String = "", email: String = "", password: String = "", errorMessage:String = "") {
        self.fullName = fullName
        self.email = email
        self.password = password
        self.errorMessage = errorMessage
    }
    
    func register(){
        
        guard validate() else{
           return
        }
        
        //try register
        
        Auth.auth().createUser(withEmail: email, password: password){[weak self] result , error in
            guard let userId = result?.user.uid else{
                return
            }
            self?.insertUserRecord(id:userId)
        }
        
    }
    
    private func insertUserRecord(id: String){
        
        let newUser = User(id: id, fullname: fullName, email:email, joined:Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary())

        
        
    }
    
   private func validate() -> Bool{
        errorMessage = ""
        guard !fullName.isEmpty,!email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill in all fields"

            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please Enter a valid email"

            return false
        }
        
       guard password.count >= 8 else{
           errorMessage = "Please Enter 8 digit password"

           return false
       }
        
        return true
        
    }
    
    
}
