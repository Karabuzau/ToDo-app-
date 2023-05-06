//
//  LoggingVewVewModel.swift
//  ToDo
//
//  Created by Бекжан on 06.05.2023.
//

import Foundation
import FirebaseAuth
class LoggingVewVewModel: ObservableObject{
     
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login(){
        guard validate() else {
            return
        }
        //try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill all spaces"
            return false
        }
        
        //email chaeck
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email address"
            return false
        }
        return true
    }
}
