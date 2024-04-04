//
//  TLButton.swift
//  TodoList
//
//  Created by Fatdog on 04/04/2024.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let backgroundColor: Color
    let height: Double
    let borderRadius: Double
    let action : () -> Void
    var body: some View {
        Button{
          action()
        }label: {
            
            ZStack{
                RoundedRectangle(cornerRadius: borderRadius).frame(height: height).foregroundColor(backgroundColor)
                Text(title).font(.system(size: 20)).foregroundColor(Color.white).bold()
            }
        }.padding()
    }
}

#Preview {
    TLButton(title: "Title", backgroundColor: Color.pink, height: 50, borderRadius: 10){
        //Action
    }
}
