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
    
    init(currentTrack: String, coordinator: MainMenuCoordinator) {
        self.currentTrack = currentTrack
        self.coordinator = coordinator
    }
    
    func setupGameOverListener(for scene: GameSceneProtocol, gameOverBlock: @escaping () -> Void) {
        scene.isGameOver.handleEvents(receiveOutput: { _ in
            gameOverBlock()
        })
        .sink { _ in }
        .store(in: &subscriptions)
    }
}
