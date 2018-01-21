//
//  TransactionsWidgetTableViewCell.swift
//  MobileBank
//
//  Created by Tamas Ondresik on 2018. 01. 20..
//  Copyright © 2018. Tamas Ondresik. All rights reserved.
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
