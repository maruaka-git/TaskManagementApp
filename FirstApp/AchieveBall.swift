//
//  AchieveBall.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/05/29.
//

import SpriteKit

class AchieveBall: SKScene {
    var ballCount: Int = 0

    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)

        for _ in 0..<ballCount {
            addBall()
        }
    }

    func addBall() {
        let ball = SKShapeNode(circleOfRadius: 20)
        ball.fillColor = .random
        ball.strokeColor = .clear
        ball.position = CGPoint(x: CGFloat.random(in: 30...(size.width - 30)), y: size.height - 30)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        ball.physicsBody?.restitution = 0.7
        ball.physicsBody?.friction = 0.2
        addChild(ball)
    }
}

extension SKColor {
    static var random: SKColor {
        return SKColor(
            red: CGFloat.random(in: 0.3...1),
            green: CGFloat.random(in: 0.3...1),
            blue: CGFloat.random(in: 0.3...1),
            alpha: 1.0
        )
    }
}
