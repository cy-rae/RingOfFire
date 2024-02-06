//
//  ContentView.swift
//  RingOfFire
//
//  Created by Dario Nieddu on 01.02.24.
//

import SwiftUI

struct PlayerView: View {
    @State private var playerName = ""
    @EnvironmentObject var game: Game
    
    var body: some View {
        NavigationStack {
            VStack {
                // ICON
                CircleImage(height: 200, width: 200)
                    .padding(.top)
                
                // PLAYERS LIST
                VStack (alignment: .leading) {
                    Text("Players")
                        .font(.title)
                    List {
                        ForEach(game.players) { player in
                            Text(player.name)
                        }
                        .onDelete(perform: deletePlayer)
                    }
                }
                
                // ADD PLAYER FIELDS
                HStack {
                    TextField(
                        "Add Player",
                        text: $playerName
                    )
                    .disableAutocorrection(true)
                    
                    Button(action: addPlayer) {
                        Label("", systemImage: "plus")
                            .labelStyle(.iconOnly)
                    }
                    .disabled(playerName.isEmpty)
                    .buttonStyle(.borderedProminent)
                }
                .textFieldStyle(.roundedBorder)
                .padding(.bottom, 25)
                
                // START BUTTON
                Button(action: startGame) {
                    Label("Start drinking", systemImage: "wineglass.fill")
                }
                .buttonStyle(.borderedProminent)
                .disabled(game.players.count < 2)
                
            }
            .navigationDestination(isPresented: $game.started) {
                if(game.players.count >= 2 && !game.gameOver) {
                    GameView().environmentObject(game)
                }
                if(game.gameOver) {
                    GameOverView(onRestart: {
                        game.reset()
                    })
                }
            }
        }
        .padding()
    }
    
    /**
     Add a new player with the entered name to the array.
     */
    func addPlayer() {
        // Return if user did not enter a name.
        guard !playerName.isEmpty else { return }
        
        // Add new player to array
        let newPlayer = Player(name: playerName)
        game.players.append(newPlayer)
        
        // Reset text field
        playerName = ""
    }
    
    /**
     Remove the swiped player from array.
     */
    func deletePlayer(at offsets: IndexSet) {
        game.players.remove(atOffsets: offsets)
    }
    
    /**
     Start the game by navigating to the game view. Game will not start if array is empty.
     */
    func startGame() {
        game.started = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {        
        let game = Game()
        PlayerView().environmentObject(game)
    }
}
