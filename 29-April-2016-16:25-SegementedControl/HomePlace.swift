//
//  HomePlace.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 27/06/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class HomePlace: UIView {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.alpha = 1
        self.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(dismissSelf)))
    }
    
    @objc private func dismissSelf() {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions.CurveEaseOut, animations: { 
            self.alpha = 0
        }, completion: nil)
    }
    
}