//
//  ContentView.swift
//  Quali
//
//  Created by BDabrowski on 5/29/21.
//

import SwiftUI

struct MainMenuView: View {
    
    @ObservedObject var coordinator: MainMenuCoordinator
    
    init(coordinator: MainMenuCoordinator) {
        self.coordinator = coordinator
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: GameSceneView(),
                isActive: self.$coordinator.isMainMenuHidden
            ) {
                Text("New Game")
            }
            .isDetailLink(false)
        }
        .environmentObject(coordinator)
    }
}
