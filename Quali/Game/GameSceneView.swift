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
        guard let scene = self.gameViewCoordinator.gameScene else {
            print("Unable to create get a reference to the gameScene.")
            return GameScene()
        }
        scene.scaleMode = .resizeFill
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
