//
//  GameViewModel.swift
//  Quali
//
//  Created by BDabrowski on 5/31/21.
//

import SwiftUI
import Combine

class GameViewModel: ObservableObject {
    
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var currentTrack: String = "Monaco"
    @Published var gameScene = GameScene()
    @Published var showGameOverView = false
    
    func setupGameOverListener(for scene: GameSceneProtocol) {
        scene.isGameOver.handleEvents(receiveOutput: { [weak self] _ in
            self?.showGameOverView.toggle()
            
            // Create a new GameScene when the game is over so that the user isn't playing the same game that ended.
            self?.gameScene = GameScene()
        })
        .sink { _ in }
        .store(in: &subscriptions)
    }
}
