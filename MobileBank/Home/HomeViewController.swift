//
//  HomeViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik on 2018. 01. 19..
//  Copyright © 2018. Tamas Ondresik. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        accountsOverview.layer.cornerRadius = accountsOverview.frame.height/8
        creditCardOverview.layer.cornerRadius = creditCardOverview.frame.height/8
        
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
