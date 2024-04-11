//
//  ContentView.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
           accountView
        }else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            TodoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home",systemImage: "house")
            }
            PeopleView()
                .tabItem {
                    Label("Peoples",systemImage: "person")
            }
            ProfileView()
                .tabItem {
                    Label("profile",systemImage: "person.circle")
            }
            
        }
    }
}

#Preview {
    MainView()
}
