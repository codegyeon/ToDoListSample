//
//  TodoModel.swift
//  ToDoListSample
//
//  Created by seungwoo on 2023/03/07.
//

import Foundation

struct TodoModel: Codable {
    var id: Int
    var title: String
    var content: String
    var timestamp: String
    var updated: Bool
}

struct TodoModelPost: Codable {
    var title: String
    var content: String
}

