//
//  TouchIDAuthentication.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import Foundation
import LocalAuthentication

class BiometricIDAuth {
    let context = LAContext()
    var loginReason = "Logging in with Touch ID"

    
    func canEvaluatePolicy() -> Bool {
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }
    
    func authenticateUser(completion: @escaping () -> Void) {
        guard canEvaluatePolicy() else {
            return
        }
        
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: loginReason) { (success, evaluateError) in
                                
                                if success {
                                    DispatchQueue.main.async {
                                        // User authenticated successfully, take appropriate action
                                        completion()
                                    }
                                } else {
                                    // TODO: deal with LAError cases
                                }
        }
    }
}
