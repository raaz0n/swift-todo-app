//
//  CourseViewModel.swift
//  TodoList
//
//  Created by Fatdog on 11/04/2024.
//

import Foundation


class PeopleViewModel: ObservableObject{
    
    func fetch(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users")else{
            return
        }
        let userList = URLSession.shared.dataTask(with: url){ data,
            _, error in
             
            guard let data = data, error = nil else {
                retun
            }
            
            ///convert to JSON
            do{
                let
                
            }catch{
                
            }
            
        }
    }
    
}
