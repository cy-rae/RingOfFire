//
//  GameView.swift
//  RingOfFire
//
//  Created by Dario Nieddu on 01.02.24.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var game: Game
    @State private var translation: CGSize = .zero
    
    var body: some View {
        VStack {
            if let questionMaster = game.questionMaster?.name {
                HStack {
                    Spacer()
                    Text(questionMaster)
                        .font(.title2)
                        .padding(.vertical)
                    Image(systemName: "crown.fill")
                        .foregroundColor(.yellow)
                        .padding(.vertical)
                }
            }
            
            Spacer()
            
            if (!game.players.isEmpty && !game.cards.isEmpty) {
                VStack{
                    Text(game.players[game.iteration % game.players.count].name)
                        .font(.largeTitle)
                        .padding(.bottom, 50)
                    
                    ZStack{
                        ForEach(game.cards.indices, id: \.self) { index in
                            CardView(card: game.cards[index]) {
                                iterate()
                            }
                            .offset(x: 0, y: 0)
                            .font(.title)
                            .frame(width: 350, height: 250)
                        }
                    }
                }
            } else {
                Text("No players available")
            }
            
            Spacer()
        }
    }
    
    func iterate() {
        game.iteration = game.iteration + 1;
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let player1 = Player(name: "Justin")
        let player2 = Player(name: "Hannes")
        let player3 = Player(name: "Dario")
        let players: [Player] = [player1, player2, player3]
        
        let card1 = Card(symbol: Symbol.CLUB, value: "A", description: "Fluss")
        let card2 = Card(symbol: Symbol.HEART, value: "J", description: "Regel")
        let card3 = Card(symbol: Symbol.SPADE, value: "8", description: "Eight is mate")
        let cards = [card1, card2, card3]
        
        let game = Game(players: players, cards: cards, questionMaster: player2)
        
        GameView().environmentObject(game)
    }
}
