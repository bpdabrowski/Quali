//
//  MainMenuUITests.swift
//  QualiUITests
//
//  Created by BDabrowski on 7/29/21.
//

import XCTest

class MainMenuViewUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var newGameButton: XCUIElement!
    
    override func setUp() {
        // App Setup
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()
        
        // Show MainMenu Workflow
        self.newGameButton = self.app.buttons[AccId.newGameButtonAccId]
    }
    
    func testNewGameButtonLabel() {
        XCTAssertTrue(newGameButton.isEnabled)
        XCTAssertEqual(newGameButton.label, "New Game")
    }
    
    func testNewGameButtonTap() {
        self.newGameButton.tap()
        XCTAssertTrue(app.otherElements[AccId.gameSceneAccId].waitForExistence(timeout: 1))
    }
}
