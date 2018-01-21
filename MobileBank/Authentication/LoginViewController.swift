//
//  ViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var infoMessage: UILabel!
    @IBOutlet weak var touchIdLoginButton: UIButton!
    @IBOutlet weak var passwordInput: UITextField!
    
    let segueID = "login"
    let touchId = BiometricIDAuth()
    let infoLabelForTouchId = "Please enter your pin and press login or touch the fingerprint piture to login with Touch ID!"
    let infoLabelWithoutTouchId = "Please enter your pin and press login!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordInput.delegate = self
        updateInfoMessage()
        touchIdLoginButton.isHidden = !touchId.canEvaluatePolicy()
    }

    @IBAction func login(_ sender: Any) {
        
        if checkLogin(password: passwordInput.text!) {
            print("You have successfully logged in!")
            
            performSegue(withIdentifier: segueID, sender: self)
        }
        else {
            showLoginFailedAlert()
        }
        
    }
    
    @IBAction func biometricLogin(_ sender: Any) {
        
        touchId.authenticateUser() { [weak self] message in
            
            if let message = message {
                let alertView = UIAlertController(title: "Error",
                                                  message: message,
                                                  preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Darn!", style: .default)
                alertView.addAction(okAction)
                self?.present(alertView, animated: true)

            }
            else {
                self?.performSegue(withIdentifier: (self?.segueID)!, sender: self)
            }
        }
    }
    
    func updateInfoMessage() {
        
        if touchId.canEvaluatePolicy() {
            infoMessage.text = infoLabelForTouchId
        }
        else {
            infoMessage.text = infoLabelWithoutTouchId
        }
    }
    
    func checkLogin(password: String) -> Bool {
        let credentialType = "pincredential"
        do {
            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                    account: credentialType,
                                                    accessGroup: KeychainConfiguration.accessGroup)
            let keychainPassword = try passwordItem.readPassword()
            return password == keychainPassword
        } catch {
            fatalError("Error reading password from keychain - \(error)")
        }
    }
    
    private func showLoginFailedAlert() {
        let alertView = UIAlertController(title: "Login Problem",
                                          message: "Wrong password.",
                                          preferredStyle:. alert)
        let okAction = UIAlertAction(title: "Close", style: .default)
        alertView.addAction(okAction)
        present(alertView, animated: true)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}

