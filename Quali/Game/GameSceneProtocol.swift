//
//  GameSceneProtocol.swift
//  Quali
//
//  Created by BDabrowski on 5/31/21.
//

import Combine
import SpriteKit

protocol GameSceneProtocol {
    var isGameOver: PassthroughSubject<Bool, Never> { get }
}
