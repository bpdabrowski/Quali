//
//  GameOverView.swift
//  Quali
//
//  Created by BDabrowski on 6/2/21.
//

import SwiftUI

struct GameOverView: View {
    
    @EnvironmentObject var coordinator: MainMenuCoordinator
    @ObservedObject var gameViewCoordinator: GameViewCoordinator
    
    var body: some View {
        VStack {
            Button("Restart") {
                self.gameViewCoordinator.showGameOverView.toggle()
            }
            .accessibility(identifier: "RestartButton")
            
            Button(action: { self.coordinator.isMainMenuHidden.toggle() }) {
                Text("Main Menu")
            }
            .accessibility(identifier: "MainMenuButton")
        }
    }
}
