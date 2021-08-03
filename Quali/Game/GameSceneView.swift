//
//  GameSceneView.swift
//  Quali
//
//  Created by BDabrowski on 5/29/21.
//

import SwiftUI
import SpriteKit
import Combine

struct GameSceneView: View {
    
    @StateObject private var gameViewCoordinator: GameViewCoordinator = GameViewCoordinator()
    
    var scene: SKScene {
        let scene = self.gameViewCoordinator.gameScene
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .aspectFill
        self.gameViewCoordinator.setupGameOverListener()
        
        return scene
    }

    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .accessibilityIdentifier("GameScene")
    }
}
