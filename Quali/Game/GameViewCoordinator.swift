//
//  GameViewModel.swift
//  Quali
//
//  Created by BDabrowski on 5/31/21.
//

import SwiftUI
import Combine

class GameViewCoordinator: ObservableObject {
    
    private static var trackName = "Bristol"
    private var subscriptions = Set<AnyCancellable>()
    private(set) var gameScene: GameScene! = GameScene(fileNamed: trackName)
    
    @Published var showGameOverView = false

    func setupGameOverListener() {
        self.gameScene.isGameOver.sink(receiveValue: { [weak self] isGameOver in
            guard let self = self, isGameOver == true else { return }
            self.showGameOverView = isGameOver

            // Create a new GameScene when the game is over so that the user isn't playing the same game that ended.
            self.gameScene = GameScene(fileNamed: Self.trackName)
        })
        .store(in: &subscriptions)
    }
    
    #if DEBUG
    func setGameScene(_ gameScene: GameScene) {
        self.gameScene = gameScene
    }
    #endif
}
