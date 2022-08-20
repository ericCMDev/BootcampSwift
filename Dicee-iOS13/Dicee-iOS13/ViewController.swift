//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //per crear la referència s'ha de mantenir la tecla control^ i arrossegar
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    /*   override func viewDidLoad() {
        super.viewDidLoad()
        
      després de "=" 'ha d'utilitzar #imageLiteral
        diceImageView1.image = #imageLiteral(resourceName: "DiceSix")
        diceImageView2.image = #imageLiteral(resourceName: "DiceTwo")
        
        alpha és la propietat de opacitat / transparencia de l'objecte
        diceImageView1.alpha = 0.5
         
    }
     */
    
    
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        //fem servir let perquè és un array en aquest cas que mai canviarà els seus valors de dins, per tant no cal utilitzar var
        let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        
        //2 maneres de fer el random
        diceImageView1.image = diceArray.randomElement()
        diceImageView2.image = diceArray[Int.random(in: 0...5)]
        
    }
    
}

