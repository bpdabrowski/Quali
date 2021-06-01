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
    
    @ObservedObject var viewModel: GameViewModel
    
    var scene: SKScene {
        let scene = GameScene()
        scene.currentTrack = viewModel.currentTrack
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .aspectFill
        viewModel.setupGameOverListener(for: scene)
        
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
