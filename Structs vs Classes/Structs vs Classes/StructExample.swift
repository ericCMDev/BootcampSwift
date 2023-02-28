//
//  StructExample.swift
//  Structs vs Classes
//
//  Created by Eric Cabestany Mena on 28/2/23.
//

import Foundation



struct StructHero {
    
    var name: String
    var universe: String
    
    func reverseName() -> String {
        return String(self.name.reversed())
    }
}

