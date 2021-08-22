//
//  GameScene.swift
//  Quali
//
//  Created by BDabrowski on 5/29/21.
//

import SpriteKit
import Combine

class GameScene: SKScene {
    
    let isGameOver = PassthroughSubject<Bool, Never>()
    private var car: CarNode!
    private var contactDelegate: PhysicsContactDelegate?
    
    override func didMove(to view: SKView) {
        self.contactDelegate = PhysicsContactDelegate(isGameOver: self.isGameOver)
        self.physicsWorld.contactDelegate = contactDelegate
        
        var startFinishLine: StartFinishLineNode!
        self.enumerateChildNodes(withName: "//*") { node, _  in
            if let trackNode = node as? TrackNode {
                trackNode.setupNode(for: trackNode.name!)
            } else if let startFinishLineNode = node as? StartFinishLineNode {
                startFinishLineNode.setupNode()
                startFinishLine = startFinishLineNode
            }
        }
        
        self.car = CarNode(startingPosition: startFinishLine.startPosition)
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
    
    private func setupCamera() {
        guard let camera = self.camera else { return }
        camera.setScale(3)
        
        let zeroDistance = SKRange(constantValue: 0)
        let playerConstraint = SKConstraint.distance(zeroDistance, to: self.car)
        camera.constraints = [playerConstraint]
    }
    
    #if DEBUG
    func getContactDelegate() -> PhysicsContactDelegate {
        return self.contactDelegate!
    }
    #endif
}
