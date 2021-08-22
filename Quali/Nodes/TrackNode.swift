//
//  TrackNode.swift
//  Quali
//
//  Created by BDabrowski on 8/17/21.
//

import SpriteKit

class TrackNode: SKSpriteNode {
    
    func setupNode(for imageName: String) {
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: imageName), size: self.size)
        self.zPosition = ZPosition.trackElement
        if let physicsBody = self.physicsBody {
            physicsBody.makeStatic()
            physicsBody.collisionBitMask = PhysicsCategory.None
            physicsBody.categoryBitMask = PhysicsCategory.TrackBoundary
        }
    }
}
