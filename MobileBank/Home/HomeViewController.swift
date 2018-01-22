//
//  HomeViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let dummyAccountNo = "11774555-77967487"
    let dummycreditCardNo = "5321 4534 4566 8976"
    
    var transactionList:[Transaction] = []
    let transaction1 = Transaction(id: 12, name: "McDonalds etterem", source: "11755377-77623827", target: "11736254-87648364", amount: -1345.50, user: "John Smith", date: "2016-11-15", currency:"HUF", type:"Card payment")
    let transaction2 = Transaction(id: 13, name: "Tankolas OMV", source: "11755377-77623827", target: "13536254-74473975-87648364", amount: -12000, user: "John Smith", date: "2016-11-08", currency:"HUF", type:"Card payment")
    let transaction3 = Transaction(id: 15, name: "Csoportos beszedes", source: "11755377-77623827", target: "13532454-43573975-87625164", amount: -6650, user: "John Smith", date: "2016-11-04", currency:"HUF", type:"Bank Transfer")
    
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
        
        self.transactionList.append(transaction1)
        self.transactionList.append(transaction2)
        self.transactionList.append(transaction3)
        
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
        return transactionList.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionsTableView.dequeueReusableCell(withIdentifier: transactionsWidgetCellId) as! TransactionsWidgetTableViewCell
        
        let transaction = transactionList[indexPath.row]
        cell.transactionName.text = transaction.name
        cell.amount.text = "\(transaction.amount)"+" "+transaction.currency
        cell.date.text = transaction.date
        cell.transactionType.text = transaction.type
        
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
