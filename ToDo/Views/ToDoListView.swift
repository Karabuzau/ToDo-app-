//
//  ToDoListView.swift
//  ToDo
//
//  Created by Бекжан on 06.05.2023.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()

    private let userId:String
    
    init(userId:String){
        self.userId = userId
        
    }
    var body: some View {
        NavigationView {
            VStack {
                
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
        ToDoListView(userId: "")
    }
}
