//
//  TransactionsWidgetTableViewCell.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import UIKit

class TransactionsWidgetTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var transactionName: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var transactionType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
