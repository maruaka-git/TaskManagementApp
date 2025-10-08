//
//  BottomTabBar.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/05/29.
//

import SwiftUI

struct BottomTabBar: View{
    @EnvironmentObject var taskData: TaskData
    
    var body: some View{
        HStack{
            Spacer()
            // フォルダ一覧
            NavigationLink(destination: TodoListFolder().environmentObject(taskData))
            {
                Image(systemName: "pencil.and.list.clipboard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
                    .foregroundColor(.black)
            }
            Spacer()
            // 検索
            NavigationLink(destination: Search().environmentObject(taskData))
            {
                Image(systemName: "magnifyingglass.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
                    .foregroundColor(.black)
            }
            Spacer()
            // 達成率
            NavigationLink(destination: Achievement().environmentObject(taskData))
            {
                Image(systemName: "crown")
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
