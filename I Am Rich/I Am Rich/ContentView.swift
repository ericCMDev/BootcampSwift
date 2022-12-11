//
//  ContentView.swift
//  I Am Rich
//
//  Created by Eric Cabestany Mena on 11/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
            ZStack {
                Color(.systemBlue)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("I Am Rich")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Image("diamond")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                }
                 
            }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
