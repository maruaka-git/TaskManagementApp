//
//  BottomTabBar.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/05/29.
//

import SwiftUI

struct BottomTabBar: View{
    @Binding var folderLists: [TaskFolder]
    
    var body: some View{
        HStack{
            Spacer()
            // フォルダ一覧
            NavigationLink(destination: TodoListFolder(folderLists: $folderLists))
            {
                Image(systemName: "pencil.and.list.clipboard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
                    .foregroundColor(.black)
            }
            Spacer()
            // 検索
            NavigationLink(destination: Search(folderLists: $folderLists))
            {
                Image(systemName: "magnifyingglass.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
                    .foregroundColor(.black)
            }
            Spacer()
            // 達成率
            NavigationLink(destination: Achievement(folderLists: $folderLists))
            {
                Image(systemName: "crown")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
                    .foregroundColor(.black)
            }
            Spacer()
            // 設定
            NavigationLink(destination: Setting(folderLists: $folderLists))
            {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
                    .foregroundColor(.black)
            }
            Spacer()
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.top, 30)
        .background(Color(UIColor(red: 147/255, green: 198/255, blue: 217/255, alpha: 0.5)))
    }
}
