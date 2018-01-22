//
//  Account.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import Foundation

struct Account {
    var customerId:Int
    var accountNumber:String
    var accountBalance:Double
    var isPrimary:Bool
    var openingDate: String
    
    init(custID: Int, number: String, balance: Double, primary: Bool, date: String) {
        self.customerId = custID
        self.accountNumber = number
        self.accountBalance = balance
        self.isPrimary = primary
        self.openingDate = date
    }
}
