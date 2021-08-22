//
//  StartFinishLineNodeTests.swift
//  QualiTests
//
//  Created by BDabrowski on 8/17/21.
//

import XCTest
@testable import Quali

class StartFinishLineNodeTests: XCTestCase {
    
    let finishLine = StartFinishLineNode(color: .white,
                                         size: CGSize(width: 1, height: 1))
    
    func testStartPosition() {
        XCTAssertEqual(finishLine.startPosition.x, -20)
        XCTAssertEqual(finishLine.startPosition.y, -100)
    }

    func testSetupNode() {
        finishLine.setupNode()
        
        let pb = finishLine.physicsBody!
        XCTAssertFalse(pb.affectedByGravity)
        XCTAssertFalse(pb.allowsRotation)
        XCTAssertFalse(pb.isDynamic)
        XCTAssertEqual(pb.categoryBitMask, PhysicsCategory.StartFinishLine)
        XCTAssertEqual(pb.collisionBitMask, PhysicsCategory.None)
        XCTAssertEqual(finishLine.zPosition, ZPosition.trackElement)
    }
}
