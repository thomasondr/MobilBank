//
//  ViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var infoMessage: UILabel!
    @IBOutlet weak var touchIdLoginButton: UIButton!
    @IBOutlet weak var passwordInput: UITextField!
    
    let segueID = "login"
    let touchId = BiometricIDAuth()
    let dummyInfoLabel = "Please enter your pin and press login or touch the fingerprint piture to login with Touch ID!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        touchId.authenticateUser() { [weak self] in
            self?.performSegue(withIdentifier: (self?.segueID)!, sender: self)
        }
    }
    
    func updateInfoMessage() {
        infoMessage.text = dummyInfoLabel;
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
}

