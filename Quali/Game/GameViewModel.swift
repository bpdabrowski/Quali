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
    
    func setupGameOverListener(for scene: GameSceneProtocol) {
        scene.isGameOver.handleEvents(receiveOutput: { isGameOver in
            print("Does this get called?")
            self.gameOver()
        })
        .sink { _ in }
        .store(in: &subscriptions)
    }
    
    func gameOver() {
        // Call coordinator gameOver
        print("Game over method called in Game View Model.")
    }
}
