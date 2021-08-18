//
//  GameSceneTests.swift
//  QualiTests
//
//  Created by BDabrowski on 8/16/21.
//

import XCTest
import SpriteKit
@testable import Quali

class GameSceneTests: XCTestCase {
    
    let gameScene = GameScene()
    
    func testDidMoveToView() {
        let mockStartFinishLineNode = MockStartFinishLineNode()
        mockStartFinishLineNode.name = "StartFinishLine"
        gameScene.addChild(mockStartFinishLineNode)
        let camera = SKCameraNode()
        gameScene.camera = camera
        
        gameScene.didMove(to: SKView())
        
        XCTAssertTrue(gameScene.physicsWorld.contactDelegate === gameScene)
        XCTAssertTrue(mockStartFinishLineNode.setupNodeCalled)
        XCTAssertTrue(gameScene.children.contains { $0.isKind(of: CarNode.self) })
        XCTAssertEqual(gameScene.camera!.xScale, 3)
        XCTAssertEqual(gameScene.camera!.yScale, 3)
        XCTAssertTrue(gameScene.camera!.constraints!.first!.enabled)
    }
    
    class MockStartFinishLineNode: StartFinishLineNode {
        
        var setupNodeCalled = false
        override func setupNode() {
            self.setupNodeCalled = true
        }
    }
}
