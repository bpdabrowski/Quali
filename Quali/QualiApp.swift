//
//  QualiApp.swift
//  Quali
//
//  Created by BDabrowski on 5/29/21.
//

import SwiftUI

@main
struct QualiApp: App {
    
    @StateObject var coordinator = MainMenuCoordinator()
    
    var body: some Scene {
        WindowGroup {
            MainMenuView(coordinator: coordinator)
        }
    }
}
