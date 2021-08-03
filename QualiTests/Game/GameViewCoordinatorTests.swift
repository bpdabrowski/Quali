//
//  GameViewCoordinatorTests.swift
//  QualiTests
//
//  Created by BDabrowski on 8/2/21.
//

import XCTest
import SpriteKit
@testable import Quali

class GameViewCoordinatorTests: XCTestCase {
    
    private var gameViewCoordinator: GameViewCoordinator!
    private var mockGameScene: GameScene!

    override func setUp() {
        self.gameViewCoordinator = GameViewCoordinator()
        self.mockGameScene = MockGameScene()
        self.gameViewCoordinator.setGameScene(self.mockGameScene)
    }
    
    func testSetupGameOverListener_True() {
        self.gameViewCoordinator.setupGameOverListener()
        self.mockGameScene.isGameOver.send(true)
        XCTAssertTrue(self.gameViewCoordinator.showGameOverView)
        XCTAssertFalse(self.gameViewCoordinator.gameScene === self.mockGameScene)
    }
    
    func testSetupGameOverListener_False() {
        self.gameViewCoordinator.setupGameOverListener()
        self.mockGameScene.isGameOver.send(false)
        XCTAssertFalse(self.gameViewCoordinator.showGameOverView)
        XCTAssertTrue(self.gameViewCoordinator.gameScene === self.mockGameScene)
    }

    class MockGameScene: GameScene { }
}
