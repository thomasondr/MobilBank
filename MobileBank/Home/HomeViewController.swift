//
//  HomeViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik on 2018. 01. 19..
//  Copyright © 2018. Tamas Ondresik. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let dummyAccountNo = "11774555-77967487"
    let dummycreditCardNo = "5321 4534 4566 8976"
    
    @IBOutlet weak var accountsOverview: UIView!
    @IBOutlet weak var accountNoLbl: UILabel!
    @IBOutlet weak var accountNumber: UILabel!
    @IBOutlet weak var accountBalanceLbl: UILabel!
    @IBOutlet weak var balance: UILabel!
    
    @IBOutlet weak var creditCardOverview: UIView!
    @IBOutlet weak var creditCardNumber: UILabel!
    @IBOutlet weak var creditCardBalance: UILabel!
    
    
    @IBOutlet weak var transactionsView: UIView!
    @IBOutlet weak var transactionsTableView: UITableView!
    let transactionsWidgetCellId = "transactionsWidgetCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactionsTableView.delegate = self
        transactionsTableView.dataSource = self
        transactionsTableView.tableFooterView = UIView(frame: CGRect.zero)

        accountsOverview.layer.cornerRadius = accountsOverview.frame.height/8
        creditCardOverview.layer.cornerRadius = creditCardOverview.frame.height/8
        transactionsView.layer.cornerRadius = transactionsView.frame.height/8
        transactionsTableView.layer.cornerRadius = transactionsTableView.frame.height/8
        
        updateAccountOverview()
        updateCreditCardOverview()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    // MARK: Accounts functions
    
    func updateAccountBalance() {
        balance.text = "1245.50"+" "+"EUR"
    }
    
    func updateAccountNumber() {
        accountNumber.text = dummyAccountNo
    }
    
    func updateAccountOverview() {
        updateAccountNumber()
        updateAccountBalance()
    }

    // MARK: Transactions functions
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionsTableView.dequeueReusableCell(withIdentifier: transactionsWidgetCellId) as! TransactionsWidgetTableViewCell
        
        
        cell.transactionName.text = "Bellozzo etterem"
        cell.amount.text = "- 1455 HUF"
        cell.date.text = "2016-08-25"
        cell.transactionType.text = "Card payment"
        
        cell.layer.cornerRadius = cell.frame.height/4
        
        return cell
    }
    
    // MARK: Cards functions
    func updateCardNumber() {
        creditCardNumber.text = dummycreditCardNo
    }
    
    func updateCardBalance() {
        creditCardBalance.text = "1432"+" EUR"
    }
    
    func updateCreditCardOverview() {
        updateCardNumber()
        updateCardBalance()
    }
    
}
