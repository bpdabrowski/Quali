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
        scene!.scaleMode = .resizeFill
        self.gameViewCoordinator.setupGameOverListener()
        return scene!
    }

    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .accessibilityIdentifier("GameScene")
        
        NavigationLink(destination: GameOverView(gameViewCoordinator: gameViewCoordinator),
                       isActive: self.$gameViewCoordinator.showGameOverView) {
            EmptyView()
        }
        .isDetailLink(false)
    }
}
