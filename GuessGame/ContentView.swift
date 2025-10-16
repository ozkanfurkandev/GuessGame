//
//  ContentView.swift
//  GuessGame
//
//  Created by Furkan Özkan on 16.10.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var correctAnswer = 0
    @State var score = 0
    @State var gameTitle = "Guess the animal"
    @State var gameSubtitle = ""
    @State var trialCount: Int = 0
    
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            
            VStack {
                Text(gameTitle)
                    .font(.system(size: 40, weight: .semibold))
                    .padding(.top, 50)
                Text(gameSubtitle)
                    .font(.system(size: 20))
                    .padding(.bottom, 50)
                HStack {
                    
                    Text("Score : \(score)")
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundStyle(Color.red)
                }
                Button(action: {
                    check(answer: 0)
                    trialCount += 1
                    
                }, label: {
                    Image("dog")
                        .resizable()
                        .frame(width: 150)
                        .frame(height: 150)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                })
                
                Button(action: {
                    check(answer: 1)
                    trialCount += 1
                    
                }, label: {
                    Image("cat")
                        .resizable()
                        .frame(width: 150)
                        .frame(height: 150)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                })
                
                Button(action: {
                    check(answer: 2)
                    trialCount += 1
                    
                }, label: {
                    Image("fox")
                        .resizable()
                        .frame(width: 150)
                        .frame(height: 150)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                })
                
                Text("Trial Count : \(trialCount)")
                    .font(.system(size: 30))
            }
            .padding()
        }
    }
    
    func check (answer: Int) {
        if answer == correctAnswer {
            score += 1
            gameTitle = "Success!"
        } else {
            if score != 0 {
                score -= 1
            }
            gameTitle = "Failed!"
        }
        if correctAnswer == 0 {
            gameSubtitle = "Correct answer is dog"
        }
        else if correctAnswer == 1 {
            gameSubtitle = "Correct answer is cat"
        }
        else if correctAnswer == 2 {
            gameSubtitle = "Correct answer is fox"
        }
        randomizeCorrectAnswer()
    }
    
    func randomizeCorrectAnswer(){
        let randomNumber: Int = Int.random(in: 0..<3)
        correctAnswer = randomNumber
    }
}

#Preview {
    ContentView()
}
