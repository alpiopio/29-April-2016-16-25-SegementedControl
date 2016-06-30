//
//  WhatsHappeningCollectionViewCell.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 29/06/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class WhatsHappeningCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var eventPrice: UILabel!
    
    var model: GotixEventsModel? {
        didSet {
            if let name = self.model?.name {
                self.eventTitle.text = name
            }
            if let date = self.model?.date {
                self.eventDate.text = date
            }
            if let location = self.model?.location {
                self.eventLocation.text = location
            }
            if let price = self.model?.lowest_available_price {
                self.eventPrice.text = String(price)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
