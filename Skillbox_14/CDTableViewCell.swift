//
//  CDTableViewCell.swift
//  Skillbox_14
//
//  Created by Sergey Chudarin on 23.03.2020.
//  Copyright © 2020 Sergey Chudarin. All rights reserved.
//

import UIKit

class CDTableViewCell: UITableViewCell {

    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var taskNum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
