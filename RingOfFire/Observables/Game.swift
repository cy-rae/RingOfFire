//
//  Game.swift
//  RingOfFire
//
//  Created by Dario Nieddu on 05.02.24.
//

import Foundation

class Game: ObservableObject {
    @Published var gameStarted: Bool
    @Published var iteration: Int
    @Published var players: [Player]
    @Published var cards: [Card]
    @Published var questionMaster: Player?
    
    init() {
        self.gameStarted = false
        self.iteration = 0
        self.players = []
        self.cards = []
        self.questionMaster = nil
    }
    
    init(cards: [Card]) {
        self.gameStarted = false
        self.iteration = 0
        self.players = []
        self.cards = cards
        self.questionMaster = nil
    }
    
    init(players: [Player], cards: [Card], questionMaster: Player?) {
        self.gameStarted = false
        self.iteration = 0
        self.players = players
        self.cards = cards
        self.questionMaster = questionMaster
    }
}
