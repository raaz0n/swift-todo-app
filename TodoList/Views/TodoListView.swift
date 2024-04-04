//
//  TodoListView.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import SwiftUI
import FirebaseFirestore

struct TodoListView: View {
    
    @StateObject var viewModel: TodoListViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    
    
    
    init( userId: String) {
        ///collection path users/<userId>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewModel(userId: userId))
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    TodoListItemView(item: item).swipeActions{
                        Button("Delete"){
                            viewModel.delete(id: item.id)
                        }.tint(.red)
                    }
                }.listStyle(PlainListStyle())
                
            }.navigationTitle("Todo List")
             .toolbar{
                    Button{
                        viewModel.showNewItemView = true
                    }label: {
                        Image(systemName: "plus")
                    }
                }
             .sheet(isPresented: $viewModel.showNewItemView, content: {
                 NewItemView(newItemPresented: $viewModel.showNewItemView)
             })
        }
        
    }
}

#Preview {
    TodoListView(userId: "SJ7FzLU4n4hS8bq2EL2CldqAbUe2")
}
