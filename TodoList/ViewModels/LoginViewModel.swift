//
//  LoginViewModel.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import Foundation
import FirebaseAuth

class LoginViewModel :ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(email: String = "", password: String = "", errorMessage: String = "") {
        self.email = email
        self.password = password
        self.errorMessage = errorMessage
    }
    
    func login(){
        guard validate() else{
            return
        }
        
        //try login
        Auth.auth().signIn(withEmail: email, password: password)
      
        
        print("Called")
    }
    
    
   private func validate() -> Bool {
       errorMessage = ""
       guard !email.trimmingCharacters(in:.whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
           errorMessage = "Please fill in all fields"
           return false
       }
       
       guard email.contains("@") && email.contains(".") else{
           errorMessage = "Please Enter a valid email"
           return false
       }
       
       return true
        
    }
}
