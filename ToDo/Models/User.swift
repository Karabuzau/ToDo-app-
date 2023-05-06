//
//  User.swift
//  ToDo
//
//  Created by Бекжан on 06.05.2023.
//

import Foundation
struct User:Codable {
    let id:String
    let name:String
    let email:String
    let joined:TimeInterval
}
