//
//  ProfileView.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                  profile(user: user)
                    
                }else{
                    Text("Loading Profile...")
                }
                
                
            }.padding(10.0).navigationTitle("Profile")
        }.onAppear{
            viewModel.fetchUser()
        }
    }
    
    
    @ViewBuilder
    func profile(user: User) -> some View{
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit).foregroundColor(Color.blue).frame(width:    125,height: 125).padding()
        
        
        // Info: Name ,Email, Memeber Since
        VStack(alignment: .leading){
            HStack{
                Text("Name: ").bold()
                Text(user.fullname)
            }.padding()
            HStack{
                Text("Email: ").bold()
                Text(user.email)
            }.padding()
            HStack{
                Text("Memeber Since: ").bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date:.abbreviated,time: .shortened))")
            }.padding()
        }
        
        //Sign Out
        TLButton(title: "Logout", backgroundColor: Color.blue, height: 50, borderRadius: 10) {
            viewModel.logout()
        }
        Spacer()
        
    }
}

#Preview {
    ProfileView()
}
