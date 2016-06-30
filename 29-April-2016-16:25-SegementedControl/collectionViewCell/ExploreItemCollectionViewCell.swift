//
//  ExploreItemCollectionViewCell.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 29/06/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class ExploreItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var themeImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryCount: UILabel!
    
    var model: GotixEventsModel? {
        didSet {
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
