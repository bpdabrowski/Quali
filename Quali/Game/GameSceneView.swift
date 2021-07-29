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
    
    @StateObject private var gameViewModel: GameViewModel = GameViewModel()
    
    var scene: SKScene {
        let scene = self.gameViewModel.gameScene
        scene.currentTrack = self.gameViewModel.currentTrack
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .aspectFill
        self.gameViewModel.setupGameOverListener(for: scene)
        
        return scene
    }

    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}
