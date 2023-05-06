//
//  ToDoApp.swift
//  ToDo
//
//  Created by Бекжан on 03.05.2023.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}


