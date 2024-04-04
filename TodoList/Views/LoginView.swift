//
//  LoginView.swift
//  TodoList
//
//  Created by Fatdog on 03/04/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title:"Todo List", subTitle:"Get Things", angle:15, backgrounColor: Color.pink)
                
            
                
                //Login Form
                Form{
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage).foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                    TLButton(title:"Login", backgroundColor: .blue, height:50, borderRadius:10){
                        viewModel.login()
                    }
                }
                //Create account Button
                
                VStack{
                    Text("New Account here?").font(.system(size: 20)).bold()
                    NavigationLink("Create An Account", destination: RegisterView())
     
                }.padding(.bottom,50)
            }
        }
    }
}

#Preview {
    LoginView()
}
 
