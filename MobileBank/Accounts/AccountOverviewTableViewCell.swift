//
//  AccountOverviewTableViewCell.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import UIKit

class AccountOverviewTableViewCell: UITableViewCell {

    @IBOutlet weak var accountNumber: UILabel!
    @IBOutlet weak var accountType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
