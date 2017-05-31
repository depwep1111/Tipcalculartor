//
//  HistoryTableViewCell.swift
//  CaulatorTip
//
//  Created by tran trung thanh on 5/29/17.
//  Copyright © 2017 tran trung thanh. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    
    @IBOutlet var moneyHistory: UITextField!
    
    @IBOutlet var resultHistory: UITextField!
    @IBOutlet var tipAmountHistory: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
