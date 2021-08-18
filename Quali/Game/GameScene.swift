//
//  GameScene.swift
//  Quali
//
//  Created by BDabrowski on 5/29/21.
//

import SpriteKit
import Combine

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let isGameOver = PassthroughSubject<Bool, Never>()
    var car: CarNode!
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        let startFinishLine = self.childNode(withName: "//StartFinishLine") as! StartFinishLineNode
        startFinishLine.setupNode()
        self.car = CarNode(startingPosition: CGPoint(x: startFinishLine.position.x - 20,
                                                     y: startFinishLine.position.y - 50))
        self.addChild(self.car)
        self.setupCamera()
        
        #if DEBUG
        view.showsPhysics = true
        #endif
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if collision == PhysicsCategory.Car | PhysicsCategory.StartFinishLine {
            print("Quali Started")
        }
    }
    
    private func setupCamera() {
        guard let camera = self.camera else { return }
        camera.setScale(3)
        
        let zeroDistance = SKRange(constantValue: 0)
        let playerConstraint = SKConstraint.distance(zeroDistance, to: self.car)
        camera.constraints = [playerConstraint]
    }
}
