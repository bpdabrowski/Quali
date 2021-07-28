//
//  GameViewModel.swift
//  Quali
//
//  Created by BDabrowski on 5/31/21.
//

import SwiftUI
import Combine

class GameViewModel: ObservableObject {
    
    private unowned let coordinator: MainMenuCoordinator
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var currentTrack: String
    @Published var gameScene = GameScene()
    @Published var showGameOverView = false
    
    init(currentTrack: String, coordinator: MainMenuCoordinator) {
        self.currentTrack = currentTrack
        self.coordinator = coordinator
    }
    
    func setupGameOverListener(for scene: GameSceneProtocol) {
        scene.isGameOver.handleEvents(receiveOutput: { [weak self] _ in
            self?.showGameOverView.toggle()
            self?.gameScene = GameScene()
        })
        .sink { _ in }
        .store(in: &subscriptions)
    }
}
