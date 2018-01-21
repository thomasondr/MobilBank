//
//  CurrencyDownloadService.swift
//  MobileBank
//
//  Created by Tamas Ondresik on 2018. 01. 21..
//  Copyright © 2018. Tamas Ondresik. All rights reserved.
//

import UIKit

class CurrencyDownloadService: NSObject {
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func downloadCurrencies () -> Array<Currency> {
        
        dataTask?.cancel()
        let url = URL(string: "http://api.fixer.io/latest")
        var currencyList:[Currency] = []
        
        dataTask = defaultSession.dataTask(with: url!) { (data, response, error) in
            
            if error != nil
            {
                print ("ERROR downloading currencies")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let rates = myJson["rates"] as? NSDictionary
                        {
                            for (key, value) in rates
                            {
                                let currency:Currency = Currency(value: ((value as? Double)!), code: ((key as? String)!))
                                
                                currencyList.append(currency)
                                print(currencyList)
                            }
                        }
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        return currencyList
    }
    
//    public func getCurrencies() -> Array<Currency> {
//
//        downloadCurrencies()
//        let currencyList:[Currency] = self.currencyList
//
//        return currencyList
//    }

}
