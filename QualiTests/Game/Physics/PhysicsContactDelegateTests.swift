//
//  PhysicsContactDelegateTests.swift
//  QualiTests
//
//  Created by Dabrowski, Brendyn (B.) on 8/22/21.
//

import XCTest
import Combine
import SpriteKit
@testable import Quali

class PhysicsContactDelegateTests: XCTestCase {

    func testDidBegin() {
        let isGameOver = PassthroughSubject<Bool, Never>()
        let contactDelegate = PhysicsContactDelegate(isGameOver: isGameOver)
        var gameOverValue = false
        let cancellable = isGameOver.sink(receiveValue: { gameOverValue = $0 })
        
        let bodyA = SKPhysicsBody(circleOfRadius: 10)
        bodyA.categoryBitMask = PhysicsCategory.Car

        let bodyB = SKPhysicsBody(circleOfRadius: 10)
        bodyB.categoryBitMask = PhysicsCategory.TrackBoundary

        let contact = SKPhysicsContact()
        // Couldn't use typical mocking technique so had to use the Obj-C runtime
        // https://stackoverflow.com/a/44193961
        contact.perform(Selector(("setBodyA:")), with: bodyA)
        contact.perform(Selector(("setBodyB:")), with: bodyB)
        
        contactDelegate.didBegin(contact)
        
        XCTAssertTrue(gameOverValue)
        
        cancellable.cancel()
    }
}
