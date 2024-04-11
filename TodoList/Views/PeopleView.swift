//
//  CourseView.swift
//  TodoList
//
//  Created by Fatdog on 11/04/2024.
//

import SwiftUI

struct CourseView: View {
    var body: some View {
        NavigationView{
            VStack{
              Text("Loading Courses...")
            }.padding(10.0).navigationTitle("Courses")
        }.onAppear{
            //TODO: Call APi
        }
    }
}




#Preview {
    CourseView()
}
