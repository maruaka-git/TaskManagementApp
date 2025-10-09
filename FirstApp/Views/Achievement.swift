//
//  Achievement.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/05/29.
//

import SwiftUI

struct Achievement: View {
    @EnvironmentObject var taskData: TaskData
    
    private var completedTaskCount: Int {
        taskData.folders.flatMap { $0.tasks }.filter { $0.isChecked }.count
    }
    
    private var ballCount: Int {
        max(0, completedTaskCount / 5)
    }
    
    private var crownCount: Int {
        max(0, ballCount / 20)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Text("業績")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .padding(.vertical, 20)
                
                ScrollView {
                    VStack(spacing: 20) {
                        VStack(spacing: 10) {
                            HStack {
                                VStack(alignment: .center) {
                                    Text("達成ボールの数")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("\(ballCount) 個")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.blue)
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .center) {
                                    Text("完了タスクの数")
                                        .font(.headline)
                                        .foregroundColor(.gray)
                                    Text("\(completedTaskCount) 個")
                                        .font(.system(size: 16))
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            Divider()
                                .padding(.vertical, 5)
                        }
                        
                        if crownCount > 0 {
                            crownDisplayView
                        }
                        
                        ballDropView
                    }
                    .padding(.horizontal)
                }
                
                BottomTabBar()
                    .environmentObject(taskData)
            }
        }
        .navigationBarHidden(true)
    }
    
    private var crownDisplayView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("獲得クラウン \(crownCount)個")
                .font(.headline)
                .foregroundColor(.primary)
            
            let crownPerRow = 8
            let rows = Int(ceil(Double(crownCount) / Double(crownPerRow)))
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: crownPerRow), spacing: 4) {
                ForEach(0..<crownCount, id: \.self) { _ in
                    Image(systemName: "crown.fill")
                        .foregroundColor(Color.yellow)
                        .font(.title2)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(UIColor(red: 147/255, green: 198/255, blue: 217/255, alpha: 0.5)), lineWidth: 2))
    }
    
    private var ballDropView: some View {
        VStack(spacing: 20) {
            
            if ballCount > 0 {
                AchieveBall(ballCount: ballCount)
                    .frame(height: 350)
            } else {
                // ボールがない場合の表示
                VStack(spacing: 10) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.gray.opacity(0.5))
                    
                    Text("タスクを完了してボールを獲得しよう")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray.opacity(0.3), style: StrokeStyle(lineWidth: 2, dash: [5]))
                        )
                )
            }
        }
        .padding(.vertical, 20)
    }
}
