//
//  ToDoListItemsViewViewModel.swift
//  ToDo
//
//  Created by Бекжан on 06.05.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

/// To Do list item view single 
class ToDoListItemsViewViewModel: ObservableObject {
    init(){}
    
    func toggleIsDone (item: ToDoListItem ) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
         
    }
}
