//
//  TodoList.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/05/12.
//

import SwiftUI

struct TodoList: View {
    @EnvironmentObject var taskData: TaskData
    let folderIndex: Int
    @State private var newTask: String = ""
    
    private var folder: TaskFolder {
        taskData.folders[folderIndex]
    }
    
    private var sortedTasks: [(offset: Int, element: ToDoItem)] {
        taskData.folders[folderIndex].tasks.enumerated()
            .sorted { lhs, rhs in
                // 未完了(true)が先に来る
                (!lhs.element.isChecked && rhs.element.isChecked)
            }
    }
    
    var body: some View{
        VStack(spacing: 0){
            Text("\(folder.name)")
                .font(.system(size: 30, weight: .bold, design: .default))
                .padding(.vertical, 20)
            
            HStack{
                TextField("タスクを入力してください",text: $newTask)
                    .textFieldStyle(.roundedBorder)
                Button("追加") {
                    let trimmed = newTask.trimmingCharacters(in: .whitespaces)
                    guard !trimmed.isEmpty else { return }
                    taskData.folders[folderIndex].tasks.append(ToDoItem(isChecked: false, task: trimmed))
                    newTask=""
                }
                .font(.system(size: 15, design: .default))
                .foregroundColor(.black)
                .padding(.all, 6)
                .background(Color(UIColor(red: 147/255, green: 198/255, blue: 217/255, alpha: 0.5)))
                .cornerRadius(2)
            }
            .padding(.all, 16)
            .background(Color(UIColor.systemBackground))
            
            Divider()
            
            ScrollView{
                LazyVStack(alignment: .leading, spacing: 8){
                    ForEach(sortedTasks, id: \.element.id) { (offset, element) in
                        let index = offset
                        HStack{
                            Button(action: {
                                taskData.folders[folderIndex].tasks[index].isChecked.toggle()
                            }) {
                                Image(systemName:
                                        folder.tasks[index].isChecked ? "checkmark.square.fill" : "square"
                                )
                                .imageScale(.large)
                                .foregroundStyle(.blue)
                            }
                            Text(element.task)
                                .strikethrough(element.isChecked)
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
            
            BottomTabBar()
                .environmentObject(taskData)
        }
        //キーボードで押し上げられないようにする
        .ignoresSafeArea(.keyboard)
        .navigationBarHidden(true)
    }
}
