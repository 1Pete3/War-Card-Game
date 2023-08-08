//
//  ContentView.swift
//  War Card Game
//
//  Created by Admin on 8/7/23.
//

import SwiftUI

struct ContentView: View {
    @State var playerCard = "back"
    @State var cpuCard = "back"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    @State var result = false
    @State var resultText = ""
    var body: some View {
        
        ZStack{
            Image("background-plain")
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button{
                    deal()
                    if(playerScore ==  20){
                        result = true
                        resultText = "You won! 🏆"
                        playerCard = "back"
                        playerScore = 0
                        cpuScore = 0
                        cpuCard = "back"
                        
                    }
                    else if (cpuScore == 20){
                        result = true
                        resultText = "You lost 😔"
                        playerCard = "back"
                        playerScore = 0
                        cpuScore = 0
                        cpuCard = "back"
                        
                    }
                   
                    
                }label:{
                    Image("button")
                }.alert( isPresented: $result){
                    Alert(
                    title: Text(resultText)
                    )
                }
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom,10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom,10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .foregroundColor(.white)
        
    }
    
    func deal(){
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        if(playerCardValue > cpuCardValue){
            playerScore += 1
        }
        else if (cpuCardValue > playerCardValue){
            cpuScore += 1
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
