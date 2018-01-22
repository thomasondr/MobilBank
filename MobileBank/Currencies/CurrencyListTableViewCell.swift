//
//  CurrencyListTableViewCell.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import UIKit

class CurrencyListTableViewCell: UITableViewCell {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var buyValue: UILabel!
    @IBOutlet weak var middleValue: UILabel!
    @IBOutlet weak var sellValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
