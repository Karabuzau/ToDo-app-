//
//  ToDoListViewModel.swift
//  ToDo
//
//  Created by Бекжан on 06.05.2023.
//

import Foundation
import FirebaseFirestore

/// ViewModel for lisy of items view
/// Primary tab 
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    init(userId: String){
        self.userId = userId
        
    }
    
    /// Delete todolistitem
    /// - Parameter id: item id to delete
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
