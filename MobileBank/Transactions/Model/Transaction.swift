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
    
    init(id: Int, name: String, source: String, target: String, amount: Double, user:Int) {
        self.id = id
        self.name = name
        self.sourceAccount = source
        self.targetAccount = target
        self.amount = amount
        self.userId = user
    }
}
