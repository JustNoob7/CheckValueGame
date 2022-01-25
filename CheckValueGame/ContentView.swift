//
//  ContentView.swift
//  CheckValueGame
//
//  Created by Ярослав Бойко on 07.12.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = 50.0
    @State private var isPresented = false
    @State private var guessedNumber = Int.random(in: 0...100)
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Передвиньте слайдер как можно ближе к: \(guessedNumber)")
            HStack {
                Text("0")
                CustomSlider(sliderValue: $sliderValue,
                             alpha: computeScore(),
                             color: .red)
                Text("100")
            }
            
            Button(action: { isPresented = true }) {
                Text("Проверить")
            }
            .alert("Your score:", isPresented: $isPresented, actions: {}) {
                Text("\(computeScore())")
            }
            
            Button(action: { guessedNumber = Int.random(in: 0...100) }) {
                Text("Начать заново")
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(guessedNumber - lround(sliderValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
