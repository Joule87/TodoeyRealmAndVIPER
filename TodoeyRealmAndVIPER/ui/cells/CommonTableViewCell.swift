//
//  CommonTableViewCell.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/20/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit
import SwipeCellKit

class CommonTableViewCell: SwipeTableViewCell {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottonLabel: UILabel!
    
    static let cellIdentifier = "CommonTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
