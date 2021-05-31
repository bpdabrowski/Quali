//
//  GameViewModel.swift
//  Quali
//
//  Created by BDabrowski on 5/31/21.
//

import SwiftUI

class GameViewModel: ObservableObject {
    
    private unowned let coordinator: MainMenuCoordinator
    @Published var currentTrack: String
    
    init(currentTrack: String, coordinator: MainMenuCoordinator) {
        self.currentTrack = currentTrack
        self.coordinator = coordinator
    }

}
