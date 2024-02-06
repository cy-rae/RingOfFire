import SwiftUI

struct Test: View {
    @State private var cards = ["Card 1", "Card 2", "Card 3", "Card 4", "Card 5"]
    @State private var currentIndex = 0
    @State private var translation: CGSize = .zero

    var body: some View {
        ZStack {
            ForEach(cards.indices, id: \.self) { index in
                TestCardView(content: cards[index])
                    .offset(x: index == currentIndex ? translation.width : 0)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                translation = value.translation
                            }
                            .onEnded { value in
                                if value.translation.width < -50 {
                                    withAnimation {
                                        // Check if the user swiped the last card
                                        if currentIndex == cards.count - 1 {
                                            // Insert a new card at the end
                                            cards.append("New Card")
                                        }
                                        currentIndex = min(currentIndex + 1, cards.count - 1)
                                        translation = .zero
                                    }
                                } else {
                                    withAnimation {
                                        translation = .zero
                                    }
                                }
                            }
                    )
                    .allowsHitTesting(index == currentIndex)
            }
        }
        .padding()
    }
}

struct TestCardView: View {
    let content: String

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 2)
            )
            .shadow(radius: 5)
            .frame(width: 300, height: 200)
            .overlay(Text(content).foregroundColor(.black))
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
