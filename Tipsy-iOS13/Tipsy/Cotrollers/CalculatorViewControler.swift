//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewControler: UIViewController {
    
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!

    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var totalBillAmount = 0.0
    var numericBillTextField = 0.0
    var finalResult = ""
 
    
    @IBAction func tipChanged(_ sender: UIButton) {
        //per defecte tots deseleccionats
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        //fem que quan fem click es seleccioni només el clickat
        sender.isSelected = true
        
        let buttonTipTitle = sender.currentTitle!
        let buttonTitleWithoutLastChar = String(buttonTipTitle.dropLast())
        
        
        let tipToDecimal = Double(buttonTitleWithoutLastChar)!
        
        tip = tipToDecimal / 100
        
        billTextField.endEditing(true)
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        
        if(bill != ""){
            numericBillTextField = Double(bill)!
            totalBillAmount = (numericBillTextField * (1 + tip)) / Double(numberOfPeople)
            finalResult = (String(format: "%.2f", totalBillAmount))
            
            self.performSegue(withIdentifier: "goToResults", sender: self)
            
        }
        
        
       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalBill = finalResult
            destinationVC.numOfPersons = numberOfPeople
            destinationVC.tip = Int(tip*100)
            
        }
    }
    
}

