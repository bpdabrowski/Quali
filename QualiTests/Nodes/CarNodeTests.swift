//
//  CarNodeTests.swift
//  QualiTests
//
//  Created by BDabrowski on 8/17/21.
//

import XCTest
@testable import Quali

class CarNodeTests: XCTestCase {

    func testInit() {
        let startingPosition = CGPoint(x: 1, y: 1)
        let carNode = CarNode(startingPosition: startingPosition)
        let pb = carNode.physicsBody!
        
        XCTAssertEqual(carNode.zPosition, ZPosition.car)
        XCTAssertEqual(carNode.position, startingPosition)
        XCTAssertEqual(pb.restitution, 1.0)
        XCTAssertEqual(pb.linearDamping, 0.5)
        XCTAssertEqual(pb.friction, 0)
        XCTAssertFalse(pb.allowsRotation)
        XCTAssertFalse(pb.affectedByGravity)
        XCTAssertEqual(pb.categoryBitMask, PhysicsCategory.Car)
        XCTAssertEqual(pb.contactTestBitMask, PhysicsCategory.StartFinishLine)
        XCTAssertEqual(pb.collisionBitMask, PhysicsCategory.None)
    }
}
