//
//  TransactionsOverviewTableViewCell.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import UIKit

class TransactionsOverviewTableViewCell: UITableViewCell {

    @IBOutlet weak var transactionId: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var transactionType: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
