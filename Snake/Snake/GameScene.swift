//
//  GameScene.swift
//  Snake
//
//  Created by Владимир Васин on 19.05.2021.
//

import SpriteKit
import GameplayKit

struct CollisionCategory {
    static let Snake: UInt32 = 0x1 << 0
    static let SnakeHead: UInt32 =  0x1 << 1
    static let Apple: UInt32 = 0x1 << 2
    static let EngeBody: UInt32 = 0x1 << 3
}

class GameScene: SKScene {
    
    var snake: Snake?
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.blue
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.allowsRotation = false
        view.showsPhysics = true
        
        let counterClockWiseButton = SKShapeNode()
        counterClockWiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        counterClockWiseButton.position = CGPoint(x: view.scene!.frame.minX + 30, y: view.scene!.frame.minY + 30)
        counterClockWiseButton.fillColor = UIColor.green
        counterClockWiseButton.strokeColor = UIColor.green
        counterClockWiseButton.lineWidth = 10
        counterClockWiseButton.name = "counterClockWiseButton"
        self.addChild(counterClockWiseButton)
        
        let clockWiseButton = SKShapeNode()
        clockWiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        clockWiseButton.position = CGPoint(x: view.scene!.frame.maxX - 70, y: view.scene!.frame.minY + 30)
        clockWiseButton.fillColor = UIColor.green
        clockWiseButton.strokeColor = UIColor.green
        clockWiseButton.lineWidth = 10
        clockWiseButton.name = "clockWiseButton"
        self.addChild(clockWiseButton)
        
        createApple()
        
        snake = Snake(apPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        self.addChild(snake!)
        
        self.physicsWorld.contactDelegate = self
        
        self.physicsBody?.categoryBitMask = CollisionCategory.EngeBody
        self.physicsBody?.collisionBitMask = CollisionCategory.Snake  | CollisionCategory.SnakeHead
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode, touchNode.name == "counterClockWiseButton" || touchNode.name == "clockWiseButton" else {
                return
            }
            touchNode.fillColor = .darkGray
            
            if touchNode.name == "counterClockWiseButton" {
                snake!.moveCounterClockWise()
            } else if touchNode.name == "clockWiseButton" {
                snake!.moveClockWise()
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode, touchNode.name == "counterClockWiseButton" || touchNode.name == "clockWiseButton" else {
                return
            }
            touchNode.fillColor = .green
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        snake!.move()
    }
    
    func createApple () {
        let randX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX - 10)))
        let randY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY - 10)))
        
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        self.addChild(apple)
    }
}

extension GameScene:SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let collisionObject = bodyes - CollisionCategory.SnakeHead
        
        switch collisionObject {
        case CollisionCategory.Apple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            snake?.addBodypart()
            apple?.removeFromParent()
            createApple()
        case CollisionCategory.EngeBody:
            self.removeAllChildren()
            didMove(to: view!)
        default:
            break
        }
        
    }
}
