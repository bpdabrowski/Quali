//
//  StartFinishLine.swift
//  Quali
//
//  Created by BDabrowski on 8/11/21.
//

import SpriteKit

class StartFinishLineNode: SKSpriteNode {
    
    func setupNode() {
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.isDynamic = false
        self.physicsBody?.categoryBitMask = PhysicsCategory.StartFinishLine
        self.physicsBody?.collisionBitMask = PhysicsCategory.None
    }
}
