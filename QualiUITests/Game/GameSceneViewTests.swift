//
//  GameSceneViewTests.swift
//  QualiUITests
//
//  Created by BDabrowski on 8/1/21.
//

import XCTest

class GameSceneViewTests: XCTestCase {

    private var app: XCUIApplication!
    private var gameScene: XCUIElement!
    
    override func setUp() {
        // App Setup
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()
        
        // Show GameScene Workflow
        let newGameButton = self.app.buttons[AccId.newGameButtonAccId]
        newGameButton.tap()
        self.gameScene = self.app.otherElements[AccId.gameSceneAccId]
    }
    
    func testGameOver() {
        self.gameScene.tap()
        XCTAssertTrue(self.app.buttons[AccId.restartButtonAccId].waitForExistence(timeout: 1))
        XCTAssertTrue(self.app.buttons[AccId.mainMenuButtonAccId].waitForExistence(timeout: 1))
    }
}
