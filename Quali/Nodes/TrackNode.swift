//
//  TrackNode.swift
//  Quali
//
//  Created by BDabrowski on 8/17/21.
//

import SpriteKit

class TrackNode: SKSpriteNode {
    
    func setupNode(for imageName: String) {
        self.zPosition = ZPosition.track
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: imageName), size: self.size)
        if let physicsBody = self.physicsBody {
            physicsBody.affectedByGravity = false
            physicsBody.allowsRotation = false
            physicsBody.isDynamic = false
            physicsBody.categoryBitMask = PhysicsCategory.TrackBoundary
            physicsBody.collisionBitMask = PhysicsCategory.None
        }
    }
}
