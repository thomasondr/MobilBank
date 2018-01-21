//
//  EnterPinViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik on 2018. 01. 21..
//  Copyright © 2018. Tamas Ondresik. All rights reserved.
//

import UIKit

// Keychain Configuration
struct KeychainConfiguration {
    static let serviceName = "StorePIN"
    static let accessGroup: String? = nil
}

class EnterPinViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var pinInput: UITextField!
    
    var pinItems: [KeychainPasswordItem] = []
    let segueID = "pinEnterSuccess"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pinInput.delegate = self
    }
    
    @IBAction func storePIN(_ sender: Any) {
        
        if pinInput.text == "" {
            let alert = UIAlertController(title: "Wrong Credentials", message: "PIN is missing!", preferredStyle:UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Close", style: UIAlertActionStyle.cancel, handler: nil)
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
        pinInput.resignFirstResponder()
        
        let credentialType = "pincredential"
        let newPin = pinInput.text!
        
        do {
            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                    account: credentialType,
                                                    accessGroup: KeychainConfiguration.accessGroup)
            
            try passwordItem.savePassword(newPin)
            
            // Store activation in NSUserDefaults
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "activated")
            userDefaults.synchronize()
            
            performSegue(withIdentifier: segueID, sender: self)
            
        } catch {
            fatalError("Error updating keychain - \(error)")
        }
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
