//
//  CardView.swift
//  RingOfFire
//
//  Created by Dario Nieddu on 05.02.24.
//

import SwiftUI

struct CardView: View {
    var background = Color(red: 0.17, green: 0.17, blue: 0.17)
    var black = Color(red: 0.45, green: 0.45, blue: 0.45)
    var red = Color(red: 1, green: 0.2, blue: 0.3)
    @State var card: Card
    @State var offset = CGSize.zero
    var onSwiped: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(background)
                .shadow(color: Color.gray, radius: 11)

            // Your card content goes here
            VStack {
                HStack{
                    VStack {
                        Text(card.value)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(getColor())
                        
                            SymbolView(symbol: card.symbol)
                    }.padding()
                    
                    Spacer()
                }
                
                Spacer()

                Text(card.description)
                    .font(.title)
                    .italic()
                    .padding()
                
                Spacer()
                
                    HStack{
                        Spacer()
                        
                        VStack {
                            SymbolView(symbol: card.symbol)
                                .rotationEffect(.degrees(180))
                            
                            Text(card.value)
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(getColor())
                                .rotationEffect(.degrees(180))
                        }.padding()
                    }
            }
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(DragGesture()
            .onChanged { gesture in
                offset = gesture.translation
            }.onEnded {_ in
                withAnimation {
                    swipeCard(width: offset.width)
                }
            }
        )
        .padding()
    }
    
    func getColor() -> Color {
        if (card.symbol == Symbol.DIAMOND || card.symbol == Symbol.HEART) {
            return red;
        } else {
            return black;
        }
    }
    
    func swipeCard(width: CGFloat) {
        switch(width) {
        case -500...(-150):
            offset = CGSize(width: -500, height: 0)
            onSwiped()
        case 500...(150):
            offset = CGSize(width: 500, height: 0)
            onSwiped()
        default:
            offset = CGSize(width: 0, height: 0)
        }
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = Card(symbol: Symbol.SPADE, value: "A", description: "Fluss")
        
        CardView(card: card) {
            print("Swiped")
        }
            .frame(width: 350, height: 200)
    }
}
