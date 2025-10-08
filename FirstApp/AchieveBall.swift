//
//  AchieveBall.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/05/29.
//

import SwiftUI
import SpriteKit

struct AchieveBall: View {
    let ballCount: Int
    @State private var scene: AchieveBallScene?
    @State private var previousBallCount: Int = -1
    @State private var sceneKey: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
                
                if let scene = scene {
                    SpriteView(scene: scene)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .id(sceneKey)
                } else {
                    VStack {
                        ProgressView()
                            .scaleEffect(1.5)
                        Text("準備中...")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                    }
                }
            }
        }
        .onAppear {
            setupScene()
        }
        .onChange(of: ballCount) { newValue in
            if newValue != previousBallCount {
                setupScene()
            }
        }
    }
    
    private func setupScene() {
        if let oldScene = scene {
            oldScene.removeAllActions()
            oldScene.removeAllChildren()
            oldScene.physicsWorld.speed = 0
            oldScene.isPaused = true
        }
        
        let sceneSize = CGSize(width: 350, height: 350)
        let newScene = AchieveBallScene(size: sceneSize, ballCount: ballCount)
        scene = newScene
        previousBallCount = ballCount
        sceneKey = UUID().uuidString
    }
}

#Preview {
    AchieveBall(ballCount: 5)
        .frame(height: 350)
        .padding()
}
