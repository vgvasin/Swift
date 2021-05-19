//
//  Snake.swift
//  Snake
//
//  Created by Владимир Васин on 19.05.2021.
//

import UIKit
import SpriteKit

class Snake: SKShapeNode {
    var body = [SnakeBodyPart]()
    let moveSpeed = 125.0
    var angle: CGFloat = 0.0
    
    
    convenience init(apPoint point:CGPoint){
        self.init()
        
        let head = SnakeHead(atPoint: point)
        body.append(head)
        addChild(head)
    }
    
    func addBodypart(){
        let newBodyPart = SnakeBodyPart(atPoint: CGPoint(x: body[0].position.x, y: body[0].position.y))
        
        body.append(newBodyPart)
        addChild(newBodyPart)
    }
    
    func moveBodyPart(_ p: SnakeBodyPart, c: SnakeBodyPart){
        let moveAction = SKAction.move(to: CGPoint(x: p.position.x, y: p.position.y), duration: 0.1 )
        c.run(moveAction)
    }
    
    func moveHead(_ head: SnakeBodyPart) {
        let dx = CGFloat(moveSpeed) * sin(angle)
        let dy = CGFloat(moveSpeed) * cos(angle)
        
        let nexPosition = CGPoint(x: head.position.x + dx, y: head.position.y + dy)
        let moveAction = SKAction.move(to: nexPosition, duration: 1.0)
        
        head.run(moveAction)
        
    }
    
    func move() {
        guard !body.isEmpty else {
            return
        }
        let head = body[0]
        moveHead(head)
        
        for index in (0..<body.count) where index > 0  {
            let previousBodyPart = body[index - 1]
            let currentBodyPart = body[index]
            moveBodyPart(previousBodyPart, c: currentBodyPart)
            
        }
    }
    
    func moveClockWise(){
        angle += CGFloat(Double.pi / 2)
    }
    
    func moveCounterClockWise(){
        angle -= CGFloat(Double.pi / 2)
    }
}
 
