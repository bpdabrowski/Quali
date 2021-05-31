//
//  ContentView.swift
//  Quali
//
//  Created by BDabrowski on 5/29/21.
//

import SwiftUI

struct MainMenuCoordinatorView: View {
    
    @ObservedObject var coordinator: MainMenuCoordinator
    
    var body: some View {
        if let gameViewModel = coordinator.gameViewModel {
            VStack {
                NavigationView {
                    NavigationLink(
                        destination: GameSceneView(viewModel: gameViewModel)
                    ) {
                        Text("New Game")
                    }
                }
            }
        } else {
            // Display error view that automatically sends a report of the game scene not being available.
        }
    }
}
