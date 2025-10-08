//
//  ContentView.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/05/07.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var taskData = TaskData()
    
    var body: some View {
        Title()
            .environmentObject(taskData)
    }
}
