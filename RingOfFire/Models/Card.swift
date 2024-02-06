//
//  Card.swift
//  RingOfFire
//
//  Created by Dario Nieddu on 05.02.24.
//

import Foundation

struct Card {
    var symbol: Symbol
    var value: String
    var description: String

    init(symbol: Symbol, value: String, description: String) {
        self.symbol = symbol
        self.value = value
        self.description = description
    }
}
