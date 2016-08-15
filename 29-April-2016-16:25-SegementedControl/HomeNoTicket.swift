//
//  HomeNoTicket.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 29/06/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class HomeNoTicket: UIView {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var dashedView: UIView!
    @IBOutlet weak var dashedView2: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.cardView.layer.cornerRadius = 5
        self.cardView.layer.borderWidth = 1
        self.cardView.layer.borderColor = UIColor.groupTableViewBackgroundColor().CGColor
        self.cardView.layer.masksToBounds = true
        
        self.dashedView.backgroundColor = UIColor(patternImage: UIImage(named: "dashed")!)
        self.dashedView2.backgroundColor = UIColor(patternImage: UIImage(named: "dashed")!)
    }
    
}
