//
//  TableViewCell.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 19/08/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var profileImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.profileImage.layer.cornerRadius = 26
        self.profileImage.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
