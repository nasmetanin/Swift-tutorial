//
//  ContentView.swift
//  Casino
//
//  Created by Никита Сметанин on 20.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var score = 500
    @State var first = "apple"
    @State var second = "apple"
    @State var third = "apple"
    
    
    var body: some View {
        
        VStack {
            Spacer()
                .frame(height: 20.0)
            Text("Casino")
                .font(.headline)
                .dynamicTypeSize(.xxxLarge)
            Spacer()
            Text("Score: " + String(score))
            Spacer()
            HStack {
                Image(first)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(second)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(third)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
            if score > 0 {
                Button {
                    let availablePics = ["apple", "cherry", "star"]
                    first = availablePics.randomElement()!
                    second = availablePics.randomElement()!
                    third = availablePics.randomElement()!
                    
                    if (second == first) && (third == first) {
                        score += 80
                    } else if (first == second) || (first == third) || (second == third) {
                        score += 10
                    } else {
                        score -= 100
                    }
                    
                    
                    
                } label: {
                    Text("Play")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .padding(.vertical, 8.0)
                        .padding(.horizontal, 30.0)
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(.pink))
                }
 
            } else {
                Text("Game over!")
                Text("You lost")
                Button {
                    
                    first = "apple"
                    second = "apple"
                    third = "apple"
                    
                    score = 500
                  
                   
                } label: {
                    Text("Retry")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .padding(.vertical, 8.0)
                        .padding(.horizontal, 30.0)
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(.pink))
                }
            }
            
            Spacer()
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
