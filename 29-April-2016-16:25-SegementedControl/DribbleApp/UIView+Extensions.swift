//
//  UIView+Extensions.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 30/04/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

extension UIView {
    
    func addConstarintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [ String : UIView ]()
        for (index, view) in views.enumerate() {
            let key = "v\(index)"
                viewsDictionary[key] = view
                view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
    
}