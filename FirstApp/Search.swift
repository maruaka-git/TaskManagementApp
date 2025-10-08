//
//  Search.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/05/29.
//

import SwiftUI

struct Search: View {
    @EnvironmentObject var taskData: TaskData
    @State private var searchWord: String = ""
    @State private var searchResults: [(folderIndex: Int, item: ToDoItem)] = []
    
    var body: some View{
        NavigationStack{
            VStack(spacing: 0){
                Text("検索")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .padding(.vertical, 20)
                
                HStack{
                    TextField("検索したいワードを入力してください",text: $searchWord)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {
                        UIApplication.shared.endEditing()
                        searchResults = []
                        guard !searchWord.isEmpty else { return }

                        for (fidx,folder) in taskData.folders.enumerated() {
                            if folder.name.contains(searchWord) {
                                for item in folder.tasks {
                                    searchResults.append((folderIndex: fidx, item: item))
                                }
                            } else {
                                for item in folder.tasks {
                                    if item.task.contains(searchWord) {
                                        searchResults.append((folderIndex: fidx, item: item))
                                    }
                                }
                            }
                        }
                        searchWord = ""
                    }){
                        Text("検索")
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
                        if searchResults.isEmpty {
                            Text("検索結果はありません")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                        } else {
                            ForEach(Array(searchResults.enumerated()), id: \.offset) { pair in
                                let res = pair.element
                                NavigationLink(destination: TodoList(folderIndex: res.folderIndex).environmentObject(taskData)) {
                                    VStack(alignment: .leading) {
                                        Text("フォルダ: \(taskData.folders[res.folderIndex].name)")
                                            .font(.headline)
                                        Text("タスク: \(res.item.task)")
                                            .foregroundColor(.black)
                                            .strikethrough(res.item.isChecked)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                    )
                                }
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
