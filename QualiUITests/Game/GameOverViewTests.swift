//
//  GameOverViewTests.swift
//  QualiUITests
//
//  Created by BDabrowski on 8/1/21.
//

import XCTest

class GameOverViewTests: XCTestCase {

    private var app: XCUIApplication!
    private var gameScene: XCUIElement!
    private var restartButton: XCUIElement!
    private var mainMenuButton: XCUIElement!
    
    override func setUp() {
        // App Setup
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()
        
        // Show GameOverView Workflow
        let newGameButton = self.app.buttons[AccId.newGameButtonAccId]
        newGameButton.tap()
        self.gameScene = self.app.otherElements[AccId.gameSceneAccId]
        self.gameScene.tap()
        self.restartButton = self.app.buttons[AccId.restartButtonAccId]
        self.mainMenuButton = self.app.buttons[AccId.mainMenuButtonAccId]
    }
    
    func testRestartButtonLabel() {
        XCTAssertTrue(self.restartButton.isHittable)
        XCTAssertEqual(self.restartButton.label, "Restart")
    }
    
    func testRestartButtonTap() {
        self.restartButton.tap()
        XCTAssertFalse(self.restartButton.isHittable)
        XCTAssertTrue(self.gameScene.isHittable)
    }
    
    func testMainMenuButtonLabel() {
        XCTAssertTrue(self.mainMenuButton.isHittable)
        XCTAssertEqual(self.mainMenuButton.label, "Main Menu")
    }
    
    func testMainMenuButtonTap() {
        self.mainMenuButton.tap()
        XCTAssertFalse(self.mainMenuButton.isHittable)
        XCTAssertTrue(self.app.buttons[AccId.newGameButtonAccId].isHittable)
    }
}
