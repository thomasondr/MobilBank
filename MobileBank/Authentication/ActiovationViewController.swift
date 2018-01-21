//
//  ActiovationViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import UIKit
import Firebase
import FirebaseAuth

class ActivationViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let segueID = "activate"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func activate(_ sender: Any) {
        if username.text == "" && password.text == "" {
            let alert = UIAlertController(title: "Wrong Credentials", message: "Username and/or password missing!", preferredStyle:UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Close", style: UIAlertActionStyle.cancel, handler: nil)
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        else {
            
            FIRAuth.auth()?.signIn(withEmail: self.username.text!, password: self.password.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    // Store activation in NSUserDefaults
                    
                    let userDefaults = UserDefaults.standard
                    userDefaults.set(true, forKey: "activated")
                    userDefaults.synchronize()
                    
                    //Go to the PIN enter if the login is sucessful
                    self.performSegue(withIdentifier: self.segueID, sender: nil)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
}
