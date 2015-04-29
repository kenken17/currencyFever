//
//  CurrencyTableViewCell.swift
//  Currency Fever
//
//  Created by Ken on 28/4/15.
//  Copyright (c) 2015 North Borneo Interactive. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet weak var UILabelCode: UILabel!
    @IBOutlet weak var UILabelName: UILabel!
    @IBOutlet weak var UILabelValue: UILabel!
    @IBOutlet weak var UIImageViewFlag: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
