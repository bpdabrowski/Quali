//
//  GameScene.swift
//  Quali
//
//  Created by BDabrowski on 5/29/21.
//

import SpriteKit
import Combine

class GameScene: SKScene {
    
    let isGameOver = PassthroughSubject<Bool, Never>()

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isGameOver.send(true)
    }
}
