//
//  Setting.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/05/29.
//

import SwiftUI

struct Setting: View {
    @Binding var folderLists: [TaskFolder]

    var body: some View{
        NavigationStack{
            VStack(spacing: 0){
                Text("設定")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .padding(.vertical, 20)
                
                Divider()
                
                ScrollView{
                    VStack(spacing: 0){
                        NavigationLink(destination: ThemeColor()){
                            HStack{
                                Text("テーマカラー")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .padding(.leading, 16)
                                Spacer()
                                Image(systemName: "squareshape.fill")
                                    .foregroundColor(.blue)
                                Image(systemName: "greaterthan.square")
                                    .padding(.trailing, 16)
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .background(Color.white)
                            .overlay(Rectangle().stroke(Color.gray.opacity(0.5), lineWidth: 1))
                        }
                        NavigationLink(destination: ThemeColor()){
                            HStack{
                                Text("パスコード設定")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .padding(.leading, 16)
                                Spacer()
                                Image(systemName: "greaterthan.square")
                                    .padding(.trailing, 16)
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: .infinity, minHeight: 60)
                            .background(Color.white)
                            .overlay(Rectangle().stroke(Color.gray.opacity(0.5), lineWidth: 1))
                        }
                    }
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
        Setting(folderLists: $dummyFolders)
}
