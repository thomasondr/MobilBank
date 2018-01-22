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
    var customerName: String
    var accountType: String
    
    init(custID: Int, number: String, balance: Double, primary: Bool, date: String, custName: String, type: String) {
        self.customerId = custID
        self.accountNumber = number
        self.accountBalance = balance
        self.isPrimary = primary
        self.openingDate = date
        self.customerName = custName
        self.accountType = type
    }
    
}
