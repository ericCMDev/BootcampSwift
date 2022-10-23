//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Eric Cabestany Mena on 23/10/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalBill : String?
    var tip = 0
    var numOfPersons = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalBill
        settingsLabel.text = "Split between \(numOfPersons) people, with \(tip)% tip."
        
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
