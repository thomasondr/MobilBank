//
//  CurrencyListViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik on 2018. 01. 19..
//  Copyright © 2018. Tamas Ondresik. All rights reserved.
//

import UIKit

class CurrencyListViewController: UIViewController {

    @IBOutlet weak var goToCalculator: UIButton!
    
    let calculatorScreenId = "goToCalculator"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func navigateToCalculator(_ sender: Any) {
        performSegue(withIdentifier: calculatorScreenId, sender: self)
    }
}
