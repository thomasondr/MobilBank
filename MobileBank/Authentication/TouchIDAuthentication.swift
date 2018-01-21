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
    
    func authenticateUser(completion:  @escaping (String?) -> Void) {
        guard canEvaluatePolicy() else {
            completion("Touch ID not available")
            return
        }
        
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: loginReason) { (success, evaluateError) in
                                
                                if success {
                                    DispatchQueue.main.async {
                                        completion(nil)
                                    }
                                } else {
                                    let message: String
                                    
                                    switch evaluateError {
                                    case LAError.authenticationFailed?:
                                        message = "There was a problem verifying your identity."
                                    case LAError.userCancel?:
                                        message = "You pressed cancel."
                                    case LAError.userFallback?:
                                        message = "You pressed password."
                                    case LAError.biometryNotAvailable?:
                                        message = "Face ID/Touch ID is not available."
                                    case LAError.biometryNotEnrolled?:
                                        message = "Face ID/Touch ID is not set up."
                                    case LAError.biometryLockout?:
                                        message = "Face ID/Touch ID is locked."
                                    default:
                                        message = "Face ID/Touch ID may not be configured"
                                    }
                                    
                                    completion(message)
                                }
        }
    }
}
