//
//  ContentView.swift
//  Quali
//
//  Created by BDabrowski on 5/29/21.
//

import SwiftUI

struct MainMenuCoordinatorView: View {
    
    @ObservedObject var coordinator: MainMenuCoordinator
    @State var isActive: Bool = false
    
    init(coordinator: MainMenuCoordinator) {
        self.coordinator = coordinator
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        if let gameViewModel = coordinator.gameViewModel {
            
            NavigationView {
                NavigationLink(
                    destination: GameSceneView(viewModel: gameViewModel, rootIsActive: self.$isActive),
                    isActive: $isActive
                ) {
                    Text("New Game")
                }
                .isDetailLink(false)
            }
        } else {
            // Display error view that automatically sends a report of the game scene not being available.
        }
    }
}
