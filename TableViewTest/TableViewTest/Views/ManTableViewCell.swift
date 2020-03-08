//
//  BoyTableViewCell.swift
//  TableViewTest
//
//  Created by mikewang on 2020/2/20.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class ManTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var innerBeautySwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
