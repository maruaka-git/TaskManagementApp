//
//  AchieveBallScene.swift
//  FirstApp
//
//  Created by 千田明香里 on 2025/06/01.
//

import SpriteKit

class AchieveBallScene: SKScene {
    private let ballCount: Int
    private var ballsDropped = 0
    private var isDropping = false
    private var hasStarted = false
    
    init(size: CGSize, ballCount: Int) {
        self.ballCount = ballCount
        super.init(size: size)
        setupScene()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScene() {
        scaleMode = .aspectFill
        backgroundColor = SKColor.white
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        physicsWorld.speed = 1.0
        
        setupBoundaries()
    }
    
    private func setupBoundaries() {
        let ballRadius: CGFloat = 16
        let floorY: CGFloat = ballRadius/2
        let floorThickness: CGFloat = 20
        
        let floor = SKShapeNode(rect: CGRect(x: 0, y: 0, width: size.width, height: floorThickness))
        floor.fillColor = .clear
        floor.strokeColor = .clear
        floor.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: size.width, height: floorThickness))
        floor.physicsBody?.isDynamic = false
        floor.physicsBody?.friction = 0.8
        floor.physicsBody?.restitution = 0.2
        floor.position = CGPoint(x: size.width / 2, y: floorY)
        addChild(floor)
        
        let wallThickness: CGFloat = 20
        
        let leftWall = SKShapeNode(rect: CGRect(x: 0, y: 0, width: wallThickness, height: size.height))
        leftWall.fillColor = .clear
        leftWall.strokeColor = .clear
        leftWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: wallThickness, height: size.height))
        leftWall.physicsBody?.isDynamic = false
        leftWall.physicsBody?.friction = 0.8
        leftWall.physicsBody?.restitution = 0.2
        leftWall.position = CGPoint(x: wallThickness / 2, y: size.height / 2)
        addChild(leftWall)
        
        let rightWall = SKShapeNode(rect: CGRect(x: 0, y: 0, width: wallThickness, height: size.height))
        rightWall.fillColor = .clear
        rightWall.strokeColor = .clear
        rightWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: wallThickness, height: size.height))
        rightWall.physicsBody?.isDynamic = false
        rightWall.physicsBody?.friction = 0.8
        rightWall.physicsBody?.restitution = 0.2
        rightWall.position = CGPoint(x: size.width - wallThickness / 2, y: size.height / 2)
        addChild(rightWall)
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        guard !hasStarted && !isDropping else {
            return
        }
        
        hasStarted = true
        
        let waitAction = SKAction.wait(forDuration: 0.3)
        let startAction = SKAction.run { [weak self] in
            self?.startDroppingBalls()
        }
        
        run(SKAction.sequence([waitAction, startAction]), withKey: "initialDrop")
    }
    
    private func startDroppingBalls() {
        guard ballCount > 0 && !isDropping else {
            print("No balls to drop")
            return
        }
        
        isDropping = true
        ballsDropped = 0
        
        for i in 0..<ballCount {
            let delay = Double(i) * 0.1
            let waitAction = SKAction.wait(forDuration: delay)
            let dropAction = SKAction.run { [weak self] in
                self?.dropSingleBall()
            }
            
            let sequence = SKAction.sequence([waitAction, dropAction])
            run(sequence, withKey: "dropBall_\(i)")
        }
        
        let totalTime = Double(ballCount) * 0.1 + 2.0
        let resetAction = SKAction.run { [weak self] in
            self?.isDropping = false
        }
        
        run(SKAction.sequence([
            SKAction.wait(forDuration: totalTime),
            resetAction
        ]), withKey: "resetDropping")
    }
    
    private func dropSingleBall() {
        let ballRadius: CGFloat = 15
        let ball = SKShapeNode(circleOfRadius: ballRadius)
        
        ball.fillColor = generateRandomColor()
        ball.strokeColor = .clear
        
        let xPosition = CGFloat.random(in: ballRadius...(size.width - ballRadius))
        ball.position = CGPoint(x: xPosition, y: size.height + ballRadius)
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ballRadius)
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.restitution = 0.3
        ball.physicsBody?.friction = 0.8
        ball.physicsBody?.mass = 0.8
        ball.physicsBody?.angularDamping = 0.8
        ball.physicsBody?.linearDamping = 0.3
        
        addChild(ball)
        ballsDropped += 1
        
        let cleanupAction = SKAction.run { [weak ball, weak self] in
            guard let ball = ball, let self = self else { return }
            if ball.position.y < -50 {
                ball.removeFromParent()
            }
        }
        
        let repeatCleanup = SKAction.repeatForever(
            SKAction.sequence([
                SKAction.wait(forDuration: 3.0),
                cleanupAction
            ])
        )
        
        ball.run(repeatCleanup, withKey: "cleanup")
    }
    
    private func generateRandomColor() -> SKColor {
        return SKColor(
            red: CGFloat.random(in: 0.3...1),
            green: CGFloat.random(in: 0.3...1),
            blue: CGFloat.random(in: 0.3...1),
            alpha: 1.0
        )
    }
}
