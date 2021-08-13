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
        let texture = SKTexture(imageNamed: "car")
        super.init(texture: texture, color: .white, size: CGSize(width: 15, height: 35))
        self.name = "car"
        self.zPosition = ZPosition.car
        self.position = startingPosition
        
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.restitution = 1.0
        self.physicsBody?.linearDamping = 0.5
        self.physicsBody?.friction = 0
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.affectedByGravity = false
        
        self.physicsBody?.categoryBitMask = PhysicsCategory.Car
        self.physicsBody?.contactTestBitMask = PhysicsCategory.StartFinishLine
        self.physicsBody?.collisionBitMask = PhysicsCategory.None
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func move(target: CGPoint) {
//        guard let physicsBody = self.physicsBody else {
//            print("Unable to get a reference to the car nodes physicsBody.")
//            return
//        }
//
//        let newVelocity = (target - position).normalized() * PlayerSettings.playerSpeed
//        physicsBody.velocity = CGVector(point: newVelocity)
    }
}
