//
//  TodoListFolder.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/05/14.
//

import SwiftUI

extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TodoListFolder: View {
    @EnvironmentObject var taskData: TaskData
    @State private var folderName: String = ""
    
    
    var body: some View{
        NavigationStack{
            VStack(spacing: 0){
                Text("フォルダ一覧")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .padding(.vertical, 20)
                
                HStack{
                    TextField("タスクを入力してください",text: $folderName)
                        .textFieldStyle(.roundedBorder)
                    Button{
                        if !folderName.trimmingCharacters(in: .whitespaces).isEmpty {
                            taskData.folders.append(TaskFolder(name: folderName, tasks: []))
                            folderName = ""
                        }
                    } label: {
                        Text("追加")
                            .font(.system(size: 15, design: .default))
                            .foregroundColor(.black)
                            .padding(.all, 6)
                            .background(Color(UIColor(red: 147/255, green: 198/255, blue: 217/255, alpha: 0.5)))
                            .cornerRadius(2)
                    }
                }
                .padding(.all, 16)
                .background(Color(UIColor.systemBackground))
                
                Divider()
                
                ScrollView{
                    LazyVStack(alignment: .leading, spacing: 8){
                        ForEach(taskData.folders.indices, id: \.self) { index in
                            NavigationLink(destination: TodoList(folderIndex: index).environmentObject(taskData)){
                                FolderView(name: taskData.folders[index].name)
                                    .cornerRadius(6)
                                    .shadow(radius: 2)
                                }
                        }
                    }
                    .padding(30)
                }
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
                
                BottomTabBar()
                    .environmentObject(taskData)
            }
            //キーボードで押し上げられないようにする
            .ignoresSafeArea(.keyboard)
        }
        .navigationBarHidden(true)
    }
}

struct FolderView: View {
    let name: String

    var body: some View {
        Text(name)
            .font(.system(size: 20, weight: .bold, design: .default))
            .padding(20)
            .frame(height: 90)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
            .foregroundColor(.black)
            .cornerRadius(6)
            .shadow(radius: 2)
    }
}
