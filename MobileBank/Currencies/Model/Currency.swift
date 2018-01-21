//
//  Currency.swift
//  MobileBank
//
//  Created by Tamas Ondresik on 2018. 01. 21..
//  Copyright © 2018. Tamas Ondresik. All rights reserved.
//

import UIKit

struct Currency {
    
    var currencyValue:Double
    var currencyCode:String
    
    init(value: Double, code: String) {
        self.currencyValue = value
        self.currencyCode = code
    }
}
