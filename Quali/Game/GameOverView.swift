//
//  GameOverView.swift
//  Quali
//
//  Created by BDabrowski on 6/2/21.
//

import SwiftUI

struct GameOverView: View {
    @EnvironmentObject var coordinator: MainMenuCoordinator
    
    var body: some View {
        VStack {
            Button("Restart") {
                self.coordinator.gameViewModel?.showGameOverView.toggle()
            }
            .font(.title)
            .padding()
            .background(Color.black)
            
            Button(action: { self.coordinator.isMenuHidden = false }) {
                Text("Main Menu")
            }
        }
    }
}
