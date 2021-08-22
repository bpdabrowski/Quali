//
//  PhysicsBody+Extensions.swift
//  Quali
//
//  Created by Dabrowski, Brendyn (B.) on 8/21/21.
//

import SpriteKit

extension SKPhysicsBody {
    
    func makeStatic() {
        self.affectedByGravity = false
        self.allowsRotation = false
        self.isDynamic = false
    }
}
