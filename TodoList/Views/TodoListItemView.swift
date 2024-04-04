//
//  TodoListItemView.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var viewModel = TodoListItemViewModel()
    let item: TodoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title).bold().font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date:.abbreviated,time: .shortened))").font(.footnote).foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Button{
                viewModel.toggleIsDone(item: item)
            }label:{
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
        }
       
    }
}

#Preview {
    TodoListItemView(item: .init(id: "122", title: "Buy momo", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
