//
//  AccountDetailsViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import UIKit

class AccountDetailsViewController: UIViewController {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var accountNumber: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var customerId: UILabel!
    @IBOutlet weak var openingDate: UILabel!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var accountPriority: UILabel!
    
    var accountParameter: Account!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshLabels()
    }
    
    private func refreshLabels() {
        
        accountNumber.text = accountParameter.accountNumber
        balance.text = String(accountParameter.accountBalance)
        customerId.text = String(accountParameter.customerId)
        openingDate.text = accountParameter.openingDate
        customerName.text = accountParameter.customerName
        
        if accountParameter.isPrimary {
            accountPriority.text = "Primary"
        }
        else
        {
            accountPriority.text = "Other Account"
        }
        
    }

}
