//
//  CurrencyListViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik 
//

import UIKit

class CurrencyListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var curencyListTableView: UITableView!
    @IBOutlet weak var goToCalculator: UIButton!
    var currencyList:[Currency] = []
    let listCellID = "currencyListCell"
    let calculatorScreenId = "goToCalculator"
    var myCurrency:[String] = []
    var myValues:[Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        curencyListTableView.delegate = self
        curencyListTableView.dataSource = self
        curencyListTableView.tableFooterView = UIView(frame: CGRect.zero)
        
        downloadCurrencies()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        print(currencyList)
        curencyListTableView.reloadData()
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyList.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = curencyListTableView.dequeueReusableCell(withIdentifier: listCellID) as! CurrencyListTableViewCell
        
        let currency = currencyList[indexPath.row]
        var sellValue:Double
        var buyValue:Double
        
        if currency.currencyValue < 100 {
            sellValue = currency.currencyValue + 0.3
            buyValue = currency.currencyValue - 0.3
        }
        else {
            sellValue = currency.currencyValue + 3
            buyValue = currency.currencyValue - 4
        }
        
        cell.countryLabel.text = currency.currencyCode
        cell.buyValue.text = "\(buyValue)"
        cell.middleValue.text = "\(currency.currencyValue)"
        cell.sellValue.text = "\(sellValue)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let currencyCalculator = segue.destination as! CurrencyCalculatorViewController
        currencyCalculator.currencyList = self.currencyList
    }
    
    @IBAction func navigateToCalculator(_ sender: Any) {
        performSegue(withIdentifier: calculatorScreenId, sender: self)
    }
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func downloadCurrencies () {
        
        let url = URL(string: "http://api.fixer.io/latest")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
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
                                
                                self.currencyList.append(currency)
                            }
                        }
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
    }
    
}
