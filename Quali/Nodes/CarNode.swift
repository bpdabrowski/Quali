//
//  Car.swift
//  Quali
//
//  Created by BDabrowski on 8/5/21.
//

import SpriteKit

class CarNode: SKSpriteNode {
    
    enum PlayerSettings {
        static let playerSpeed: CGFloat = 280.0
    }
    
    init(startingPosition: CGPoint) {
        super.init(texture: SKTexture(imageNamed: "car"), color: .white, size: CGSize(width: 40, height: 94))
        self.zPosition = ZPosition.car
        self.position = startingPosition
        
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        if let physicsBody = self.physicsBody {
            physicsBody.restitution = 1.0
            physicsBody.linearDamping = 0.5
            physicsBody.friction = 0
            physicsBody.allowsRotation = false
            physicsBody.affectedByGravity = false
            physicsBody.categoryBitMask = PhysicsCategory.Car
            physicsBody.contactTestBitMask = PhysicsCategory.StartFinishLine
            physicsBody.collisionBitMask = PhysicsCategory.None
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
