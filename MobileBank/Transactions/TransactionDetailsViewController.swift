//
//  TransactionDetailsViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import UIKit

class TransactionDetailsViewController: UIViewController {

    @IBOutlet weak var transactionId: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var sourceAccunt: UILabel!
    @IBOutlet weak var targetAccount: UILabel!
    
    var transaction:Transaction!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshLabels()
    }
    
    private func refreshLabels() {
        transactionId.text = transaction.name
        amount.text = String(transaction.amount) + " " + transaction.currency
        date.text = transaction.date
        type.text = transaction.type
        customerName.text = transaction.userId
        sourceAccunt.text = transaction.sourceAccount
        targetAccount.text = transaction.targetAccount
    }
}
