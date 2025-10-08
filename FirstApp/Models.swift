//
//  Models.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/06/06.
//

import Foundation

struct ToDoItem: Codable, Identifiable {
    var id = UUID()
    var isChecked: Bool
    var task: String
}

struct TaskFolder: Codable, Identifiable {
    var id = UUID()
    var name: String
    var tasks: [ToDoItem]
}
