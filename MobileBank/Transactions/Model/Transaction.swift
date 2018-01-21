//
//  Transaction.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import Foundation

struct Transaction {
    var id: Int
    var name: String
    var sourceAccount: String
    var targetAccount:String
    var amount:Double
    var userId:Int
    var date: String
    var currency: String
    var type: String
    
    init(id: Int, name: String, source: String, target: String, amount: Double, user:Int, date: String, currency: String, type: String) {
        self.id = id
        self.name = name
        self.sourceAccount = source
        self.targetAccount = target
        self.amount = amount
        self.userId = user
        self.date = date
        self.currency = currency
        self.type = type
    }
}
