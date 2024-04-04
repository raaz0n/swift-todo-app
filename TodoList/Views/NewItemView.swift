//
//  NewItemView.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32)).bold().padding(.top,100)
            
            Form{
                TextField(
                    "Title",
                    text: $viewModel.title
                )
                DatePicker("Due Date", selection:$viewModel.dueDate).datePickerStyle(
                    GraphicalDatePickerStyle())
                TLButton(title: "Save", backgroundColor: .pink, height: 50, borderRadius:10) 
                {
                    
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                   
                }
                
            }
        }.alert(isPresented: $viewModel.showAlert, content: {
            Alert(title: Text("Error"),message: Text("Please fill in all field and select due that is today or newer"))
        })
    }
}

#Preview {
    NewItemView(
        newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        })
    )
}
