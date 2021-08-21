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
        } else if collision == PhysicsCategory.Car | PhysicsCategory.InnerBoundary {
            self.gameOver()
            print("Hit Inner Boundary")
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if collision == PhysicsCategory.Car | PhysicsCategory.OuterBoundary {
            self.gameOver()
            print("Hit Outer Boundary")
        }
    }
    
    private func gameOver() {
        self.isGameOver.send(true)
    }
}
