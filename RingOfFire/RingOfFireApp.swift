//
//  RingOfFireApp.swift
//  RingOfFire
//
//  Created by Dario Nieddu on 01.02.24.
//

import SwiftUI

@main
struct RingOfFireApp: App {
    let game = Game(cards: createCardDeck())
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(game)
        }
    }
}

/**
 Create a whole shuffled card deck.
 */
func createCardDeck() -> [Card] {
    // CLUBS
    let club7 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let club8 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let club9 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let club10 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let clubJ = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let clubQ = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let clubK = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let clubA = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    
    // SPADES
    let spade7 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let spade8 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let spade9 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let spade10 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let spadeJ = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let spadeQ = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let spadeK = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let spadeA = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    
    // DIAMONDS
    let diamond7 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let diamond8 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let diamond9 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let diamond10 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let diamondJ = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let diamondQ = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let diamondK = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let diamondA = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    
    // HEARTS
    let heart7 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let heart8 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let heart9 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let heart10 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let heartJ = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let heartQ = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let heartK = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    let heartA = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
    
    return [
        club7, club8, club9, club10, clubJ, clubQ, clubK, clubA,
        spade7, spade8, spade9, spade10, spadeJ, spadeQ, spadeK, spadeA,
        diamond7, diamond8, diamond9, diamond10, diamondJ, diamondQ, diamondK, diamondA,
        heart7, heart8, heart9, heart10, heartJ, heartQ, heartK, heartA
    ].shuffled()
}
