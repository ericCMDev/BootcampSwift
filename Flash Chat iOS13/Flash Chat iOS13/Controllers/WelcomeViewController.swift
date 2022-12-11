//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    //amagem la navBar just abans de que la vista carregui
    //sempre que fem un override d'una func nativa, cal cridar primer el super com a good practice
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    //mostrem la navBar a la que apareix la següent vista
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = ""
        var characterIndex = 0.0
        //anem a buscar el nom de la app al fitxer de Constants.swift
        //ho fem per evitar tenir strings escrites i haver-les d'escriure cada vegedad minimitzant els errors
        let titleText  = K.appName
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * characterIndex, repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            characterIndex += 1
            
        }
       
    }
    

}
