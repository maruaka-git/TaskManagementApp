//
//  Search.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/05/29.
//

import SwiftUI

struct Search: View {
    @State private var searchWord: String = ""
    @State private var searchResults: [(folderName: String, task: ToDoItem)] = []
    @Binding var folderLists: [TaskFolder]
    
    var body: some View{
        NavigationStack{
            VStack(spacing: 0){
                Text("タスク検索")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .padding(.vertical, 20)
                
                HStack{
                    TextField("検索したいワードを入力してください",text: $searchWord)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {
                        UIApplication.shared.endEditing()
                                                searchResults = []
                                                guard !searchWord.isEmpty else { return }

                        for folder in folderLists {
                            for task in folder.tasks {
                                if task.task.contains(searchWord) {
                                    searchResults.append((folder.name, task))
                                }
                            }
                        }
                        searchWord = ""
                    }){
                        Text("検索")
                            .foregroundColor(.blue)
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
                            ForEach(searchResults.indices, id: \.self) { index in
                                let result = searchResults[index]
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("フォルダ: \(result.folderName)")
                                        .font(.headline)
                                    Text("タスク: \(result.task.task)")
                                        .foregroundColor(.black)
                                        .strikethrough(result.task.isChecked)
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
                    .padding(30)
                }
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
                
                BottomTabBar(folderLists: $folderLists)
            }
            //キーボードで押し上げられないようにする
            .ignoresSafeArea(.keyboard)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    @Previewable @State var dummyFolders = [TaskFolder(name: "プレビュー", tasks: [])]
    return TodoListFolder(folderLists: $dummyFolders)
}

