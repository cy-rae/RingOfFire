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
                            if index == game.cards.count - 1 - game.iteration {
                                CardView(card: game.cards[index]) {
                                    iterate()
                                }
                                .offset(x: 0, y: 0)
                                .font(.title)
                                .frame(width: 350, height: 340)
                            }
                        }
                    }
                }
            } else {
                Text("No players available")
            }
            
            Spacer()
        }
        .onAppear {
            updateQuestionMaster()
        }
    }
    
    func iterate() {
        if game.iteration == game.cards.count-1 {
            game.gameOver = true
        } else {
            game.iteration = game.iteration + 1;
            updateQuestionMaster()
        }
    }
    
    func updateQuestionMaster() {
        let index = game.cards.count - 1 - game.iteration
        if game.cards[index].value == "Q" {
            game.questionMaster = game.players[game.iteration % game.players.count]
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let player1 = Player(name: "Justin")
        let player2 = Player(name: "Hannes")
        let player3 = Player(name: "Dario")
        let players: [Player] = [player1, player2, player3]
        
        let game = Game(players: players, started: true)
        
        GameView().environmentObject(game)
    }
}
