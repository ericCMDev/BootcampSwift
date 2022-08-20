//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]
    


    @IBAction func askButtonPressed(_ sender: UIButton){
        //two ways to do the solution (random ball)
        //solution 1 using function "randomElement():
        //with "randomElement() function you don't have to worry about the "out of range" error in arrays
        
        imageView.image = ballArray.randomElement()
        
        //solution 2 using Int.Random(in: Range):
        //with this solution you have to control the "out of range" error in arrays
        
        //imageView.image = ballArray[Int.random(in: 0..<ballArray.count)]
    }
    
}

