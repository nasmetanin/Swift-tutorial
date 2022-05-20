//
//  ContentView.swift
//  war-challenge
//
//  Created by Nikita Smetanin on 19.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerScore = 0
    @State var playerCard = "card4"
    @State var cpuScore = 0
    @State var cpuCard = "card6"
    
    
    var body: some View {
        VStack {
            Spacer()
            Image("logo")
            Spacer()
            HStack {
                Spacer()
                Image(playerCard)
                Spacer()
                Image(cpuCard)
                Spacer()
            }
            Spacer()
            Button {
                
                func checkResult(cpuCard:String, playerCard:String) {
                    let cpuString = String(cpuCard.dropFirst(4))
                    let cpu = Int(cpuString) ?? 0
                    let playerString = String(playerCard.dropFirst(4))
                    let player = Int(playerString) ?? 0
                    
                    if cpu > player {
                        cpuScore += 1
                    } else if player == cpu {
                        cpuScore += 1
                        playerScore += 1
                    } else {
                        playerScore += 1
                    }
                    
                }
                
                // update cards and score
                let card = "card"
                playerCard = card + String(Int.random(in: 2..<14))
                cpuCard = card + String(Int.random(in: 2..<14))
                checkResult(cpuCard: cpuCard, playerCard: playerCard)
                
                //cpuScore
                
                
            } label: {
               
                Image("dealbutton")
                
                    
            }
            
            Spacer()
            HStack(alignment: .center) {
                Spacer()
                VStack(alignment: .center) {
                    Text("Player")
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .padding(.bottom, 10.0)
                    Text(String(playerScore))
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                }
                .padding(20.0)
                .frame(width: 120.0)
                Spacer()
                VStack(alignment: .center) {
                    Text("CPU")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 10.0)
                    Text(String(cpuScore))
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                }
                .padding(20.0)
                .frame(width: 120.0)
                Spacer()
            }
            Spacer()
        }.background(Image("background"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
