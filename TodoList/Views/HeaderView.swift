//
//  HeaderView.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angle: Double
    let backgrounColor: Color
    
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 0).foregroundColor(backgrounColor).rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(title).font(.system(size: 50)).foregroundColor(Color.white).bold()
                Text(subTitle).font(.system(size: 20)).foregroundColor(Color.white)
            }.padding(.top,30)
        }.frame(width: UIScreen.main.bounds.width
                * 3  ,height: 300).offset(y: -100)    }
}

#Preview {
    HeaderView(title: "Title", subTitle: "SubTitle", angle:15, backgrounColor: .blue)
}
