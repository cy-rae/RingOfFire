//
//  SymbolView.swift
//  RingOfFire
//
//  Created by Dario Nieddu on 06.02.24.
//

import SwiftUI

struct SymbolView: View {
    var black = Color(red: 0.45, green: 0.45, blue: 0.45)
    var red = Color(red: 1, green: 0.2, blue: 0.3)
    @State var symbol: Symbol
    
    var body: some View {
        switch(symbol){
        case .CLUB:
            Image(systemName: "suit.spade.fill")
                .font(.largeTitle)
                .foregroundColor(getColor())
        case .SPADE:
            Image(systemName: "suit.club.fill")
                .font(.largeTitle)
                .foregroundColor(getColor())
        case .DIAMOND:
            Image(systemName: "diamond.fill")
                .font(.largeTitle)
                .foregroundColor(getColor())
        case .HEART:
            Image(systemName: "heart.fill")
                .font(.largeTitle)
                .foregroundColor(getColor())
        }
    }
    
    func getColor() -> Color {
        if (symbol == Symbol.DIAMOND || symbol == Symbol.HEART) {
            return red;
        } else {
            return black;
        }
    }
}


struct SymbolView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolView(symbol: Symbol.CLUB)
    }
}
