//
//  HomeCoordinator.swift
//  Quali
//
//  Created by BDabrowski on 5/30/21.
//

import Foundation
import SwiftUI

class MainMenuCoordinator: ObservableObject, Identifiable {
    
    // MARK: Stored Properties
    
    private let currentTrack = "Monaco" // TODO: Update this with the selected track.
    
    @Published var gameViewModel: GameViewModel
    @Published var isMenuHidden = false

    // MARK: Initialization

    init() {
        self.gameViewModel = GameViewModel(currentTrack: currentTrack)
    }
}
