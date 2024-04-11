//
//  CourseView.swift
//  TodoList
//
//  Created by Fatdog on 11/04/2024.
//

import SwiftUI

struct  PeopleView: View {
    @StateObject var viewModel = PeopleViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.peoples,id:\.self){people in
                    
                    HStack{
                        NetworkImageView(urlString: "https://cdn.icon-icons.com/icons2/2643/PNG/512/female_woman_person_people_avatar_icon_159367.png")
                        VStack(alignment: .leading){
                            Text(people.name).bold()
                            Text(people.email).bold()
                            
                        }
                        
                    }
                   
                    
                }
                
            }.navigationTitle("Peoples")
            .task {
                           await viewModel.fetch()
                       }
            
            
        }
        
    }
}




struct  NetworkImageView: View {
    let urlString: String
    @State var data: Data?
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode:.fill)
                .frame( width: 100,height: 100)
        }else{
            Image(systemName: "person")
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame( width: 100,height: 100)
                .onAppear{
                    fetchImage()
                }
        }
       
       
 
    }
    
    private func fetchImage(){
        guard let url = URL(string: urlString) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){
            data,_, _ in
            self.data = data
        }
        task.resume()
    }
}






#Preview {
    PeopleView()
}
