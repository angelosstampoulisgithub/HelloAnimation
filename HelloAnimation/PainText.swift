//
//  PainText.swift
//  HelloAnimation
//
//  Created by Angelos Staboulis on 5/9/25.
//

import SwiftUI

struct PainText: View {
    @State private var animateText = false
    let text = "Hello, World!"
    @State private var currentIndex = 0

    var body: some View {
        ZStack{
            Color.black.overlay {
                HStack(spacing: 0) {
                    // Create a letter-by-letter effect
                    ForEach(0..<text.count, id: \.self) { index in
                        Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                            .font(.custom("Bradley Hand", size: 60))
                            .foregroundColor(.red)
                            .opacity(index <= currentIndex ? 1 : 0)
                            .animation(.spring(duration: 0.1).delay(Double(index) * 0.80), value: currentIndex)
                    }
                }
                .onAppear {
                    // Start the animation when the view appears
                    withAnimation(.linear(duration: Double(text.count) * 0.20)) {
                        currentIndex = text.count - 1
                    }
                }
            }
        }
    }
}

