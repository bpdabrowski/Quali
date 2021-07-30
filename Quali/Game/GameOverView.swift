//
//  GameOverView.swift
//  Quali
//
//  Created by BDabrowski on 6/2/21.
//

import SwiftUI

struct GameOverView: View {
    
    @EnvironmentObject var coordinator: MainMenuCoordinator
    @ObservedObject var gameViewModel: GameViewModel
    
    var body: some View {
        VStack {
            Button("Restart") {
                self.gameViewModel.showGameOverView.toggle()
            }
            .font(.title)
            .padding()
            .background(Color.black)
            
            Button(action: { self.coordinator.isMainMenuHidden.toggle() }) {
                Text("Main Menu")
            }
        }
    }
}
