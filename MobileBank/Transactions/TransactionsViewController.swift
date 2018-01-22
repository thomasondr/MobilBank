//
//  TransactionsViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import UIKit

class TransactionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var transactionsTableView: UITableView!
    let cellId = "transactionOverviewCell"
    let segueId = "transactiondetails"
    
    var transactionList:[Transaction] = []
    
    let transaction1 = Transaction(id: 12, name: "McDonalds etterem", source: "11755377-77623827", target: "11736254-87648364", amount: -1345.50, user: "John Smith", date: "2016-11-15", currency:"HUF", type:"Card payment")
    let transaction2 = Transaction(id: 13, name: "Tankolas OMV", source: "11755377-77623827", target: "13536254-74473975-87648364", amount: -12000, user: "John Smith", date: "2016-11-08", currency:"HUF", type:"Card payment")
    let transaction3 = Transaction(id: 15, name: "Csoportos beszedes", source: "11755377-77623827", target: "13532454-43573975-87625164", amount: -6650, user: "John Smith", date: "2016-11-04", currency:"HUF", type:"Bank Transfer")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactionList.append(transaction1)
        transactionList.append(transaction2)
        transactionList.append(transaction3)

        transactionsTableView.delegate = self
        transactionsTableView.dataSource = self
        transactionsTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let selectedCellIndex = transactionsTableView.indexPathForSelectedRow {
            transactionsTableView.deselectRow(at: selectedCellIndex, animated: false)
        }
        
        transactionsTableView.sizeToFit()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionsTableView.dequeueReusableCell(withIdentifier: cellId) as! TransactionsOverviewTableViewCell
        
        let transaction = transactionList[indexPath.row]
        cell.transactionId.text = transaction.name
        cell.amount.text = String(transaction.amount) + " " + transaction.currency
        cell.date.text = transaction.date
        cell.transactionType.text = transaction.type
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: segueId, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rowSelected = transactionsTableView.indexPathForSelectedRow
        let detailsVC = segue.destination as! TransactionDetailsViewController
        detailsVC.transaction = transactionList[(rowSelected?.row)!]
    }
}
