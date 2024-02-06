//
//  RingOfFireApp.swift
//  RingOfFire
//
//  Created by Dario Nieddu on 01.02.24.
//

import SwiftUI

@main
struct RingOfFireApp: App {
    let game = Game()
    
    var body: some Scene {
        WindowGroup {
            PlayerView()
                .environmentObject(game)
                .preferredColorScheme(.dark)
        }
    }
}
