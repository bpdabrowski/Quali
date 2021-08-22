//
//  StartFinishLine.swift
//  Quali
//
//  Created by BDabrowski on 8/11/21.
//

import SpriteKit

class StartFinishLineNode: SKSpriteNode {
    
    var startPosition: CGPoint {
        return CGPoint(x: self.position.x - 20,
                       y: self.position.y - 100)
    }
    
    func setupNode() {
        self.zPosition = ZPosition.trackElement
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        if let physicsBody = self.physicsBody {
            physicsBody.staticBody()
            physicsBody.categoryBitMask = PhysicsCategory.StartFinishLine
            physicsBody.collisionBitMask = PhysicsCategory.None
        }
    }
}
