//
//  Game.swift
//  RingOfFire
//
//  Created by Dario Nieddu on 05.02.24.
//

import Foundation

class Game: ObservableObject {
    @Published var started: Bool
    @Published var gameOver: Bool
    @Published var iteration: Int
    @Published var players: [Player]
    @Published var cards: [Card]
    @Published var questionMaster: Player?
    
    init() {
        self.started = false
        self.gameOver = false
        self.iteration = 0
        self.players = []
        self.cards = Game.createCardDeck()
        self.questionMaster = nil
    }
    
    init(players: [Player], started: Bool) {
        self.started = started
        self.gameOver = false
        self.iteration = 0
        self.players = players
        self.cards = Game.createCardDeck()
        self.questionMaster = nil
    }
    
    /**
     Reset all properties except the players
     */
    func reset() {
        self.started = false
        self.gameOver = false
        self.iteration = 0
        self.cards = Game.createCardDeck()
        self.questionMaster = nil
    }
    
    /**
     Create a whole shuffled card deck.
     */
    static func createCardDeck() -> [Card] {
        // CLUBS
        let club7 = Card(symbol: Symbol.CLUB, value: "7", description: "Seven is heaven")
        let club8 = Card(symbol: Symbol.CLUB, value: "8", description: "Eight is mate")
        let club9 = Card(symbol: Symbol.CLUB, value: "9", description: "Nine is a rhyme")
        let club10 = Card(symbol: Symbol.CLUB, value: "10", description: "Aussuchen")
        let clubJ = Card(symbol: Symbol.CLUB, value: "J", description: "Regel")
        let clubQ = Card(symbol: Symbol.CLUB, value: "Q", description: "Question master")
        let clubK = Card(symbol: Symbol.CLUB, value: "K", description: "Kategorie")
        let clubA = Card(symbol: Symbol.CLUB, value: "A", description: "Fluss")
        
        // SPADES
        let spade7 = Card(symbol: Symbol.SPADE, value: "7", description: "Seven is heaven")
        let spade8 = Card(symbol: Symbol.SPADE, value: "8", description: "Eight is mate")
        let spade9 = Card(symbol: Symbol.SPADE, value: "9", description: "Nine is a rhyme")
        let spade10 = Card(symbol: Symbol.SPADE, value: "10", description: "Aussuchen")
        let spadeJ = Card(symbol: Symbol.SPADE, value: "J", description: "Regel")
        let spadeQ = Card(symbol: Symbol.SPADE, value: "Q", description: "Question master")
        let spadeK = Card(symbol: Symbol.SPADE, value: "K", description: "Kategorie")
        let spadeA = Card(symbol: Symbol.SPADE, value: "A", description: "Fluss")
        
        // DIAMONDS
        let diamond7 = Card(symbol: Symbol.DIAMOND, value: "7", description: "Seven is heaven")
        let diamond8 = Card(symbol: Symbol.DIAMOND, value: "8", description: "Eight is mate")
        let diamond9 = Card(symbol: Symbol.DIAMOND, value: "9", description: "Nine is a rhyme")
        let diamond10 = Card(symbol: Symbol.DIAMOND, value: "10", description: "Aussuchen")
        let diamondJ = Card(symbol: Symbol.DIAMOND, value: "J", description: "Regel")
        let diamondQ = Card(symbol: Symbol.DIAMOND, value: "Q", description: "Question master")
        let diamondK = Card(symbol: Symbol.DIAMOND, value: "K", description: "Kategorie")
        let diamondA = Card(symbol: Symbol.DIAMOND, value: "A", description: "Fluss")
        
        // HEARTS
        let heart7 = Card(symbol: Symbol.HEART, value: "7", description: "Seven is heaven")
        let heart8 = Card(symbol: Symbol.HEART, value: "8", description: "Eight is mate")
        let heart9 = Card(symbol: Symbol.HEART, value: "9", description: "Nine is a rhyme")
        let heart10 = Card(symbol: Symbol.HEART, value: "10", description: "Aussuchen")
        let heartJ = Card(symbol: Symbol.HEART, value: "J", description: "Regel")
        let heartQ = Card(symbol: Symbol.HEART, value: "Q", description: "Question master")
        let heartK = Card(symbol: Symbol.HEART, value: "K", description: "Kategorie")
        let heartA = Card(symbol: Symbol.HEART, value: "A", description: "Fluss")
        
        return [
            club7, club8, club9, club10, clubJ, clubQ, clubK, clubA,
            spade7, spade8, spade9, spade10, spadeJ, spadeQ, spadeK, spadeA,
            diamond7, diamond8, diamond9, diamond10, diamondJ, diamondQ, diamondK, diamondA,
            heart7, heart8, heart9, heart10, heartJ, heartQ, heartK, heartA
        ].shuffled()
    }
}
