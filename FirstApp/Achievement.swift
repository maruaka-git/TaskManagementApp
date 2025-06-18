//
//  Achievement.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/05/29.
//

import SwiftUI
import SpriteKit

struct Achievement: View {
    @Binding var folderLists: [TaskFolder]
    
    private var completedTaskCount: Int {
        folderLists.flatMap { $0.tasks }.filter { $0.isChecked }.count
    }
    
    private var ballCount: Int {
        completedTaskCount / 10
    }

    var scene: SKScene {
        let scene = AchieveBall()
        scene.size = CGSize(width: 400, height: 800)
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .white
        scene.ballCount = ballCount
        return scene
    }

    var body: some View {
        VStack {
            Text("達成ボール数：\(ballCount)")
                .font(.title2)
                .padding(.top)

            SpriteView(scene: scene)
                .frame(height: 600)
                .cornerRadius(16)
                .padding()
            
            BottomTabBar(folderLists: $folderLists)
        }
    }
}

private struct PreviewWrapper: View {
    @State var dummyFolders: [TaskFolder] = [
        TaskFolder(name: "テスト", tasks: [
            ToDoItem(isChecked: true, task: "タスク1"),
            ToDoItem(isChecked: true, task: "タスク2"),
            ToDoItem(isChecked: false, task: "タスク3"),
            ToDoItem(isChecked: true, task: "タスク4"),
            ToDoItem(isChecked: true, task: "タスク5"),
            ToDoItem(isChecked: true, task: "タスク6"),
            ToDoItem(isChecked: true, task: "タスク7"),
            ToDoItem(isChecked: true, task: "タスク8"),
            ToDoItem(isChecked: true, task: "タスク9"),
            ToDoItem(isChecked: true, task: "タスク10"),
            ToDoItem(isChecked: true, task: "タスク11"),
            ToDoItem(isChecked: true, task: "タスク12"),
        ])
    ]
    
    var body: some View {
        Achievement(folderLists: $dummyFolders)
    }
}
