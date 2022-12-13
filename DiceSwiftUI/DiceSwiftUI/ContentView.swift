//
//  ContentView.swift
//  DiceSwiftUI
//
//  Created by Eric Cabestany Mena on 13/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var leftDiceNumber = 1
    @State var rightDiceNumer = 2
    
    var body: some View {
        ZStack{
            
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(num: leftDiceNumber)
                    DiceView(num: rightDiceNumer)
                }
                .padding(.horizontal)
                Spacer()
                Button {
                    
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumer = Int.random(in: 1...6)
                    
                } label: {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        
                }
                .background(Color.red)
                Spacer()

                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    let num: Int
    var body: some View {
        Image("dice\(num)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}
