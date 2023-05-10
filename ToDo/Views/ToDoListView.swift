//
//  ToDoListView.swift
//  ToDo
//
//  Created by Бекжан on 06.05.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery var items: [ToDoListItem] 
    
    init(userId:String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemsView(item: item)
                        .swipeActions {
                            Button {
                                //delete
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                                    .foregroundColor(Color.red)
                                
                            }

                        }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("To Do list")
            .toolbar {
                Button {
                    //action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPreented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "V91njlL5JaNdFVcEJbednroiMnU2")
    }
}
