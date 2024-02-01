//
//  Player.swift
//  RingOfFire
//
//  Created by Dario Nieddu on 01.02.24.
//

import Foundation

struct Player: Identifiable {
    var id = UUID()
    
    var name: String
    var questionMaster: Bool
    
    init(name: String) {
        self.name = name
        self.questionMaster = false
    }
}
