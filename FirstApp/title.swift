//
//  Title.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/05/13.
//

import SwiftUI

struct TaskFolder: Identifiable{
    let id = UUID()
    var name: String
    var tasks: [ToDoItem]
}

struct Title: View {
    @State private var folders:[TaskFolder] = []
    @State private var navigate = false
    
    var body: some View{
        NavigationStack{
            ZStack{
                Color.white.ignoresSafeArea()
                VStack{
                    Text("タスク管理アプリ")
                        .font(.system(size: 35, weight: .bold, design: .default))
                        .padding(.top, 20)
                    Image("1416")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300)
                    
                    Text("画面をタップして開始")
                        .font(.system(size: 15, design: .default))
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
                NavigationLink(destination: TodoListFolder(folderLists: $folders), isActive: $navigate){
                    EmptyView()
                }.hidden()
                Color.clear.contentShape(Rectangle()).onTapGesture {
                    navigate = true
                }
            }
        }
    }
}

#Preview{
    Title()
}
