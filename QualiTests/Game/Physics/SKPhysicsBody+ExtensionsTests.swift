//
//  SKPhysicsBody+ExtensionsTests.swift
//  QualiTests
//
//  Created by Dabrowski, Brendyn (B.) on 8/22/21.
//

import XCTest
import SpriteKit
@testable import Quali

class SKPhysicsBody_ExtensionsTests: XCTestCase {

    func testStaticBody() {
        let physicsBody = SKPhysicsBody()
        physicsBody.staticBody()
        XCTAssertFalse(physicsBody.affectedByGravity)
        XCTAssertFalse(physicsBody.allowsRotation)
        XCTAssertFalse(physicsBody.isDynamic)
    }

}
