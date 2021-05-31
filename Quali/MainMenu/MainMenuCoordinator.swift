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
    
    @Published var gameViewModel: GameViewModel?
    private let currentTrack = "Monaco" // TODO: Update this with the selected track.

    // MARK: Initialization

    init() {
        self.gameViewModel = .init(currentTrack: currentTrack, coordinator: self)
    }
}
