//
//  ViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik on 2018. 01. 18..
//  Copyright © 2018. Tamas Ondresik. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var infoMessage: UILabel!
    
    let segueID = "login"
    let dummyInfoLabel = "Please enter your pin and press login or touch the fingerprint piture to login with Touch ID!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateInfoMessage()
    }

    @IBAction func login(_ sender: Any) {
        
        performSegue(withIdentifier: segueID, sender: self)
    }
    
    func updateInfoMessage() {
        infoMessage.text = dummyInfoLabel;
    }
}

