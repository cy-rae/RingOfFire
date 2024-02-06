//
//  Player.swift
//  RingOfFire
//
//  Created by Dario Nieddu on 01.02.24.
//

import Foundation

struct Player: Identifiable {
    var id: UUID
    var name: String
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}
