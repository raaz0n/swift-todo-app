//
//  ProfileView.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
   

    var body: some View {
        NavigationStack{
            VStack{
                if let user = viewModel.user{
                  profile(user: user)
                    
                }else{
                    Text("Loading Profile...")
                }
                
                
            }
            .navigationTitle("Profile")
            .padding(10.0)
        }.onAppear{
            viewModel.fetchUser()
        }
    }
    
    
    @ViewBuilder
    func profile(user: User) -> some View{
        VStack {
          /*  Use matching: .screenshots if you only want screenshots.
            Use matching: .any(of: [.panoramas, .screenshots]) if you want either of those types.
            Use matching: .not(.videos) if you want any media that isn’t a video.
            Use matching: .any(of: [.images, .not(.screenshots)])) if you want all kinds of images except screenshots. */
            PhotosPicker(selection: $avatarItem, matching: .images){
                if let image = avatarImage {
                                   image
                                       .resizable()
                                       .aspectRatio(contentMode: .fill)
                                       .foregroundColor(Color.blue)
                                       .frame(width: 125, height: 125)
                                       .clipShape(.circle)
                                       .padding()
                               } else {
                                   Image(systemName: "person.circle")
                                       .resizable()
                                       .aspectRatio(contentMode: .fit)
                                       .foregroundColor(Color.blue)
                                       .frame(width: 125, height: 125)
                                       .padding()
                               }

            }
               }.onChange(of: avatarItem) {
                   Task {
                       if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                           avatarImage = loaded
                       } else {
                           print("Failed")
                       }
                   }
               }
        
     
        
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
