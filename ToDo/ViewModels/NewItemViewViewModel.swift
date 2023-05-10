//
//  NewItemViewModel.swift
//  ToDo
//
//  Created by Бекжан on 06.05.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false 
    init(){
         
    }
    func save(){
        guard canSave else {
            return
        }
        // get current userId
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //create a model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   duedate: dueDate.timeIntervalSince1970,
                                   createDate: Date().timeIntervalSince1970 ,
                                   isDone: false
        )
        
        // save model to the database
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    var canSave:Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
