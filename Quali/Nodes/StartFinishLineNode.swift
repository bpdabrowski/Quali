//
//  StartFinishLine.swift
//  Quali
//
//  Created by BDabrowski on 8/11/21.
//

import SpriteKit

class StartFinishLineNode: SKSpriteNode {
    
    func setupNode() {
        self.zPosition = ZPosition.startFinishLine
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        if let physicsBody = self.physicsBody {
            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false
            physicsBody.isDynamic = false
            physicsBody.categoryBitMask = PhysicsCategory.StartFinishLine
            physicsBody.collisionBitMask = PhysicsCategory.None
        }
    }
}
