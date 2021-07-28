//
//  ContentView.swift
//  Quali
//
//  Created by BDabrowski on 5/29/21.
//

import SwiftUI

struct MainMenuCoordinatorView: View {
    
    @ObservedObject var coordinator: MainMenuCoordinator
    
    init(coordinator: MainMenuCoordinator) {
        self.coordinator = coordinator
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: GameSceneView(viewModel: coordinator.gameViewModel),
                isActive: self.$coordinator.isMenuHidden
            ) {
                Text("New Game")
            }
            .isDetailLink(false)
        }
        .environmentObject(coordinator)
    }
}
