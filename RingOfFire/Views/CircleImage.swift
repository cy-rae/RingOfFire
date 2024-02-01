//
//  CircleImage.swift
//  RingOfFire
//
//  Created by Dario Nieddu on 01.02.24.
//

import SwiftUI

struct CircleImage: View {
    var height: CGFloat = 200
    var width: CGFloat = 200
    
    var body: some View {
        Image("cocktail")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth: 1)
            }
            .shadow(radius: 10)
    }
}


#Preview {
    CircleImage(height: 0, width: 0)
}
