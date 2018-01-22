//
//  AccountsViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import UIKit

class AccountsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var accountsTableView: UITableView!
    let celldID = "accountCell"
    let segueID = "accountdetails"
    var accountList:[Account] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        accountList = initAccounts()
        
        accountsTableView.delegate = self
        accountsTableView.dataSource = self
        accountsTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let selectedCellIndex = accountsTableView.indexPathForSelectedRow {
            accountsTableView.deselectRow(at: selectedCellIndex, animated: false)
        }
        
        accountsTableView.sizeToFit()

        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountList.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = accountsTableView.dequeueReusableCell(withIdentifier: celldID) as! AccountOverviewTableViewCell
        
        let account = accountList[indexPath.row]
        cell.accountNumber.text = account.accountNumber
        cell.accountType.text = account.accountType
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: segueID, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rowSelected = accountsTableView.indexPathForSelectedRow
        let detailsVC = segue.destination as! AccountDetailsViewController
        detailsVC.accountParameter = self.accountList[(rowSelected?.row)!]
    }

    private func initAccounts() -> Array<Account> {
        var accountList:[Account] = []
        
        let account1 = Account(custID: 100, number: "11755377-77623827", balance: 3456.55, primary: true, date: "2015-07-13", custName: "John Smith", type: "Personal account")
        let account2 = Account(custID: 100, number: "11755388-34623847", balance: 6555.55, primary: false, date: "2016-07-14", custName: "John Smith", type: "Savings account")
        let account3 = Account(custID: 100, number: "11700379-22623855", balance: 1255, primary: false, date: "2016-11-07", custName: "John Smith", type: "Loan account")
        
        accountList.append(account1)
        accountList.append(account2)
        accountList.append(account3)
        
        return accountList
    }
}
