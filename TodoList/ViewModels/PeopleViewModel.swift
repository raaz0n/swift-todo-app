//
//  CourseViewModel.swift
//  TodoList
//
//  Created by Fatdog on 11/04/2024.
//

import Foundation


class PeopleViewModel: ObservableObject{
    
    @Published var peoples: [People] = []
    
    private let manager = APIManager()
    
    
    func fetch() async {
           do {
               peoples = try await manager.request(url: "https://jsonplaceholder.typicode.com/users")
               print(peoples)
           }catch {
               print("Fetch People error:", error)
           }
       }

    
//    func fetch(){
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users")else{
//            return
//        }
//        let task = URLSession.shared.dataTask(with: url){[weak self] data,
//            _, error in
//             
//            guard let data = data, error == nil else {
//                return
//            }
//            
//            ///convert to JSON
//            do{
//                let peoples = try JSONDecoder().decode([People].self, from:data)
//                DispatchQueue.main.sync {
//                    self?.peoples = peoples
//                }
//                
//            }catch{
//                print(error)
//            }
//            
//        }
//        task.resume()
//    }
    
}
