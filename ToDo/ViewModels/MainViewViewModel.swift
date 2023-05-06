//
//  MainViewViewModel.swift
//  ToDo
//
//  Created by Бекжан on 06.05.2023.
//

import Foundation
import FirebaseAuth
class MainViewViewModel :ObservableObject {
    @Published var currentUserid:String = ""
    private var handler:AuthStateDidChangeListenerHandle?
    
    init(){
        
        self.handler = Auth.auth().addStateDidChangeListener{[weak self]_, user in
            DispatchQueue.main.async {
                self?.currentUserid = user?.uid ?? ""}
            }
        }
    
    public var isSingedIn:Bool {
        return Auth.auth().currentUser != nil
    }
    
}
