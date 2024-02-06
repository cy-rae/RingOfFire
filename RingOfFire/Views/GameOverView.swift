//
//  GameOverView.swift
//  RingOfFire
//
//  Created by Dario Nieddu on 06.02.24.
//

import SwiftUI

struct GameOverView: View {
    var onRestart: () -> Void
    
    var body: some View {
        HStack {
            SymbolView(symbol: Symbol.CLUB)
            SymbolView(symbol: Symbol.HEART)
            SymbolView(symbol: Symbol.SPADE)
            SymbolView(symbol: Symbol.DIAMOND)
        }.padding()

        Text("Game Over")
            .font(.largeTitle)
            .onDisappear {
                onRestart()
            }
        
        HStack {
            SymbolView(symbol: Symbol.DIAMOND).rotationEffect(.degrees(180))
            SymbolView(symbol: Symbol.SPADE).rotationEffect(.degrees(180))
            SymbolView(symbol: Symbol.HEART).rotationEffect(.degrees(180))
            SymbolView(symbol: Symbol.CLUB).rotationEffect(.degrees(180))
        }.padding()
    }
}

#Preview {
    GameOverView(onRestart: {print("onRestart")})
}
