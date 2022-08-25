//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = [
    "Soft": 3,
    "Medium": 4,
    "Hard": 7
    ]
    
    var secondsRemaining = 60
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    var player: AVAudioPlayer?

    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        //invalidates the previous timer (if exists) every time we tap any button
        timer.invalidate()
        self.progressBar.progress = 0.0
        self.totalTime = 0
        self.secondsPassed = 0
       
        
        
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPassed < self.totalTime {
                self.secondsPassed += 1
                self.progressBar.progress = Float(self.secondsPassed) / Float(self.totalTime)
 
            } else {
                self.timer.invalidate()
                self.titleLabel.text = "DONE!"
                self.playSound()
            }
        }
        
        
        //print(eggTimes[hardness]!)
        
        
        
        //switch/case is more efficent in this case
        /*switch hardness {
        case "Soft":
            print(softTime)
        case "Medium":
            print(mediumTime)
        case "Hard":
            print(hardTime)
        default:
            break
        }
        */
       /* Second way to do
        if hardness == "Soft" {
            print(softTime)
        }
        if hardness == "Medium"{
            print(mediumTime)
        }
        if hardness == "Hard"{
            print(hardTime)
        }
        */
    }
    
}
