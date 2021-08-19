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
        
//        let startFinishLine = self.childNode(withName: "//StartFinishLine") as! StartFinishLineNode
//        startFinishLine.setupNode()
        
        var startFinishLine: SKNode!
        self.enumerateChildNodes(withName: "//*") { node, _  in
            if let trackNode = node as? TrackNode {
                trackNode.setupNode(for: trackNode.name!)
            } else if let startFinishLineNode = node as? StartFinishLineNode {
                startFinishLine = startFinishLineNode
                startFinishLineNode.setupNode()
            }
        }
        
        self.car = CarNode(startingPosition: CGPoint(x: startFinishLine.position.x - 20,
                                                     y: startFinishLine.position.y - 100))
        self.addChild(self.car)
        
        self.setupCamera()
        
        #if DEBUG
        view.showsPhysics = true
        #endif
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            print("Unable to get touch.")
            return
        }
        self.car.move(target: touch.location(in: self))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if collision == PhysicsCategory.Car | PhysicsCategory.StartFinishLine {
            print("Quali Started")
        } else if collision == PhysicsCategory.Car | PhysicsCategory.TrackBoundary {
            self.isGameOver.send(true)
            print("Hit Boundary")
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
