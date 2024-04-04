//
//  RegisterView.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import SwiftUI

struct RegisterView: View {
   @StateObject var viewModel = RegisterViewModel()
    var body: some View {
        HeaderView(title: "Register", subTitle:"Start Organizing tod0", angle: -15, backgrounColor: Color.green)
        Form{
            TextField("Full Name", text: $viewModel.fullName).textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
                .autocapitalization(.words)
            TextField("Email Address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
                .autocapitalization(.none)
            SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
                .autocapitalization(.none)
            
            TLButton(title:"Register", backgroundColor: .blue, height:50, borderRadius:10){
                viewModel.register()
            }
        }.offset(y: -50)
        
        VStack{
            Text("Already have an account").font(.system(size: 20)).bold()
            NavigationLink("login", destination: LoginView())
        }.padding(.bottom,50)
    
    }
}

#Preview {
    RegisterView()
}
