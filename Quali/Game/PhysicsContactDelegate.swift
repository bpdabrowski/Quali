//
//  PhysicsContactDelegate.swift
//  Quali
//
//  Created by Dabrowski, Brendyn (B.) on 8/20/21.
//

import SpriteKit
import Combine

class PhysicsContactDelegate: NSObject, SKPhysicsContactDelegate {
    
    private let isGameOver: PassthroughSubject<Bool, Never>
    
    init(isGameOver: PassthroughSubject<Bool, Never>) {
        self.isGameOver = isGameOver
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if collision == PhysicsCategory.Car | PhysicsCategory.StartFinishLine {
            print("Quali Started")
        } else if collision == PhysicsCategory.Car | PhysicsCategory.TrackBoundary {
            self.isGameOver.send(true)
            print("Hit Boundary didBegin")
        }
    }
}
