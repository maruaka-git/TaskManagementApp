//
//  TaskData.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/06/06.
//

import Foundation

class TaskData: ObservableObject {
    @Published var folders: [TaskFolder] = [] {
        didSet { save() }
    }

    private let saveKey = "task_folders"

    init() {
        load()
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(folders) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([TaskFolder].self, from: data) {
            folders = decoded
        } else {
            folders = []
        }
    }
}
