//
//  ViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik on 2018. 01. 18..
//  Copyright © 2018. Tamas Ondresik. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var loginButton: UIButton!
    

    @IBAction func login(_ sender: Any) {
        
        performSegue(withIdentifier: "login", sender: self)
    }
    
}

