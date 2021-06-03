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
    @State private var showGameOverView = false
    @Binding var rootIsActive: Bool
    
    var scene: SKScene {
        let scene = GameScene()
        scene.currentTrack = viewModel.currentTrack
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .aspectFill
        viewModel.setupGameOverListener(for: scene) {
            showGameOverView.toggle()
        }
        
        return scene
    }

    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        
        NavigationLink(destination: GameOverView(shouldPopToRootView: self.$rootIsActive), isActive: $showGameOverView) { EmptyView()
        }.isDetailLink(false)
    }
}

struct GameOverView: View {
    @Binding var shouldPopToRootView: Bool
    
    var body: some View {
        VStack {
            Button("Restart") {
//                presentationMode.wrappedValue.dismiss()
            }
            .font(.title)
            .padding()
            .background(Color.black)
            
            Button(action: { self.shouldPopToRootView = false }) {
                Text("Main Menu")
            }
        }
    }
}
