//
//  ContentView.swift
//  RingOfFire
//
//  Created by Dario Nieddu on 01.02.24.
//

import SwiftUI

struct ContentView: View {
    @State private var playerName = ""
    @EnvironmentObject var game: Game
    
    var body: some View {
        NavigationStack {
            VStack {
                // ICON
                CircleImage(height: 250, width: 250)
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
                .disabled(game.players.isEmpty)
                
            }
            .navigationDestination(isPresented: $game.gameStarted) {
                if(!game.players.isEmpty) {
                    GameView().environmentObject(game)
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
        game.gameStarted = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = Game()
        ContentView().environmentObject(game)
    }
}
