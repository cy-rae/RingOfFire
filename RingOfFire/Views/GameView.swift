//
//  GameView.swift
//  RingOfFire
//
//  Created by Dario Nieddu on 01.02.24.
//

import SwiftUI

struct GameView: View {
    var players: [Player]
    var iteration: Int32
    
    var body: some View {
        VStack {
            Text(players[Int(iteration)].name)
        }
    }
}

#Preview {
    GameView(players: [], iteration: 0)
}
