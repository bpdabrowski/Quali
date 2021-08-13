//
//  PhysicsCategory.swift
//  Quali
//
//  Created by BDabrowski on 8/11/21.
//

import Foundation

struct PhysicsCategory {
    static let None: UInt32 = 0
    static let All: UInt32 = 0xFFFFFFFF
    static let Car: UInt32 = 0b1 // 1
    static let StartFinishLine: UInt32 = 0b10 // 2
}
