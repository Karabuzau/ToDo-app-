//
//  LoggingView.swift
//  ToDo
//
//  Created by Бекжан on 06.05.2023.
//

import SwiftUI

struct LoggingView: View {
    
    @StateObject var viewModel = LoggingVewVewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "To Do List",
                           subTitle: "Get things done",
                           angle: 15,
                           background: .pink)
                

                // Login form
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Pasword", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log in",
                             background: .blue
                    ){
                            // Attempt log in
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y:-50)


                //create account
                VStack {
                    Text("New around here?")

                    NavigationLink("Create an account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

struct LoggingView_Previews: PreviewProvider {
    static var previews: some View {
        LoggingView()
    }
}
