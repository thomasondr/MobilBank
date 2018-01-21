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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        curencyListTableView.delegate = self
        curencyListTableView.dataSource = self
        curencyListTableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.currencyList = CurrencyDownloadService().downloadCurrencies()
        print(self.currencyList)
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = curencyListTableView.dequeueReusableCell(withIdentifier: listCellID) as! CurrencyListTableViewCell
        
        cell.countryLabel.text = "Hungary"
        cell.buyValue.text = "297"
        cell.middleValue.text = "300"
        cell.sellValue.text = "303"
        
        return cell
    }
    
    @IBAction func navigateToCalculator(_ sender: Any) {
        performSegue(withIdentifier: calculatorScreenId, sender: self)
    }
    
}
