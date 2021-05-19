//
//  SnakeBodyPart.swift
//  Snake
//
//  Created by Владимир Васин on 19.05.2021.
//

import UIKit
import SpriteKit

class SnakeBodyPart: SKShapeNode {
    let diametr = 10
    
    init(atPoint point: CGPoint){
        super.init()
        
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: diametr, height: diametr)).cgPath
        fillColor = .green
        strokeColor = .green
        lineWidth = 5
        self.position = point
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(diametr - 4), center: CGPoint(x: 5, y: 5))
        self.physicsBody?.isDynamic = true
        self.physicsBody?.collisionBitMask = CollisionCategory.Snake
        self.physicsBody?.contactTestBitMask = CollisionCategory.EngeBody | CollisionCategory.Apple
         
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
}
