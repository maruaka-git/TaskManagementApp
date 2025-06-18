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
    @State private var folderName: String = ""
    @Binding var folderLists: [TaskFolder]
    
    var body: some View{
        NavigationStack{
            VStack(spacing: 0){
                Text("フォルダ一覧")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .padding(.vertical, 20)
                
                HStack{
                    TextField("タスクを入力してください",text: $folderName)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {
                        if !folderName.isEmpty{
                            folderLists.append(
                                TaskFolder(name: folderName, tasks: [])
                            )
                        }
                        folderName=""
                    }){
                        Text("追加")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.all, 16)
                .background(Color(UIColor.systemBackground))
                
                Divider()
                
                ScrollView{
                    LazyVStack(alignment: .leading, spacing: 8){
                        ForEach(folderLists.indices, id: \.self) { index in
                            NavigationLink(destination: TodoList(folder: $folderLists[index], folderLists: $folderLists)) {
                                    FolderView(name: folderLists[index].name)
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
                
                BottomTabBar(folderLists: $folderLists)
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


#Preview {
    @Previewable @State var dummyFolders = [TaskFolder(name: "プレビュー", tasks: [])]
    return TodoListFolder(folderLists: $dummyFolders)
}
