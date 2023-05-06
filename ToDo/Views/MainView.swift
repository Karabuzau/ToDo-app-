//
//  ContentView.swift
//  ToDo
//
//  Created by Бекжан on 03.05.2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSingedIn, !viewModel.currentUserid.isEmpty {
            //signedin
            ToDoListView()
        }
        else {
            LoggingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
