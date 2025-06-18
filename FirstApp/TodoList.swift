//
//  TodoList.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/05/12.
//

import SwiftUI

struct ToDoItem{
    var isChecked: Bool
    var task: String
}

struct TodoList: View {
    @Binding var folder: TaskFolder
    @Binding var folderLists: [TaskFolder]
    @State private var newTask: String = ""
    
    var body: some View{
        VStack(spacing: 0){
            Text("\(folder.name)")
                .font(.system(size: 30, weight: .bold, design: .default))
                .padding(.vertical, 20)
            
            HStack{
                TextField("タスクを入力してください",text: $newTask)
                    .textFieldStyle(.roundedBorder)
                Button("追加", action: {
                    if !newTask.isEmpty{
                        folder.tasks.append(
                            ToDoItem(isChecked: false, task: newTask)
                        )
                        newTask=""
                    }
                })
            }
            .padding(.all, 16)
            .background(Color(UIColor.systemBackground))
            
            Divider()
            
            ScrollView{
                LazyVStack(alignment: .leading, spacing: 8){
                    ForEach(folder.tasks.indices, id: \.self) { index in
                        HStack{
                            Button(action: {
                                folder.tasks[index].isChecked.toggle()
                            }, label : {
                                Image(systemName:
                                        folder.tasks[index].isChecked ? "checkmark.square.fill" : "square"
                                )
                                .imageScale(.large)
                                .foregroundStyle(.pink)
                            })
                            Text(folder.tasks[index].task)
                                .strikethrough(folder.tasks[index].isChecked)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(30)
            }
            .background(Color(UIColor(red: 147/255, green: 198/255, blue: 217/255, alpha: 0.5)))
            .padding(.horizontal, 25)
            .padding(.vertical,30)
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            
            BottomTabBar(folderLists: $folderLists)
        }
        //キーボードで押し上げられないようにする
        .ignoresSafeArea(.keyboard)
        .navigationBarHidden(true)
    }
}

struct TodoList_Previews: PreviewProvider {
    @State static var dummyFolder = TaskFolder(
        name: "プレビューフォルダ",
        tasks: [
            ToDoItem(isChecked: false, task: "サンプル1"),
            ToDoItem(isChecked: true, task: "サンプル2")
        ]
    )
    
    @State static var dummyFolderLists = [
        TaskFolder(
            name: "プレビュー用フォルダ",
            tasks: [
                ToDoItem(isChecked: false, task: "サンプル1"),
                ToDoItem(isChecked: true, task: "サンプル2")
            ]
        )
    ]

    static var previews: some View {
        TodoList(folder: $dummyFolder, folderLists: $dummyFolderLists)
    }
}
