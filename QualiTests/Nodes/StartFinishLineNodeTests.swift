//
//  StartFinishLineNodeTests.swift
//  QualiTests
//
//  Created by BDabrowski on 8/17/21.
//

import XCTest
@testable import Quali

class StartFinishLineNodeTests: XCTestCase {

    func testSetupNode() {
        let finishLine = StartFinishLineNode(color: .white,
                                             size: CGSize(width: 1, height: 1))
        
        finishLine.setupNode()
        
        let pb = finishLine.physicsBody!
        XCTAssertFalse(pb.affectedByGravity)
        XCTAssertFalse(pb.allowsRotation)
        XCTAssertFalse(pb.isDynamic)
        XCTAssertEqual(pb.categoryBitMask, PhysicsCategory.StartFinishLine)
        XCTAssertEqual(pb.collisionBitMask, PhysicsCategory.None)
    }

}
