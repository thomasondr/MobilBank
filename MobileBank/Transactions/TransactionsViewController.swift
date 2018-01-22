//
//  TransactionsViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import UIKit

class TransactionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var transactionsTableView: UITableView!
    
    var transactionList:[Transaction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        transactionsTableView.delegate = self
        transactionsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
