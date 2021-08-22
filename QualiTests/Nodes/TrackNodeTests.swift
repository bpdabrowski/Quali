//
//  TrackNodeTests.swift
//  QualiTests
//
//  Created by Dabrowski, Brendyn (B.) on 8/22/21.
//

import XCTest
import SpriteKit
@testable import Quali

class TrackNodeTests: XCTestCase {

    func testSetupNode() {
        let trackNode = TrackNode(texture: SKTexture(),
                                  size: CGSize(width: 1, height: 1))
        
        trackNode.setupNode(for: "Track")
        
        let pb = trackNode.physicsBody!
        XCTAssertFalse(pb.affectedByGravity)
        XCTAssertFalse(pb.allowsRotation)
        XCTAssertFalse(pb.isDynamic)
        XCTAssertEqual(pb.categoryBitMask, PhysicsCategory.TrackBoundary)
        XCTAssertEqual(pb.collisionBitMask, PhysicsCategory.None)
        XCTAssertEqual(trackNode.zPosition, ZPosition.trackElement)
    }
}
