//
//  FirstViewController.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 30/04/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var bottomConstraint: NSLayoutConstraint?
    
    let messageContainer: UIView = {
        let view = UIView()
            view.backgroundColor = UIColor.lightGrayColor()
            view.alpha = 0.5
        return view
    }()
    
    let inputTex: UITextField = {
        let inputText = UITextField()
            inputText.placeholder = "Enter message ..."
        return inputText
    }()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.title = "Home"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let firstItem = self.tabBarController?.tabBar.items![0]
            firstItem?.badgeValue = "1"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(self.messageContainer)
        
        if let tabBarHeight = self.tabBarController?.tabBar.frame.size.height {
            self.view.addConstarintsWithFormat("H:|[v0]|", views: self.messageContainer)
            self.view.addConstarintsWithFormat("V:[v0(40)]-\(tabBarHeight)-|", views: self.messageContainer)
            self.bottomConstraint = NSLayoutConstraint(item: self.messageContainer, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1, constant: tabBarHeight)
        }
        
        
        self.messageContainer.addSubview(self.inputTex)
        
        self.messageContainer.addConstarintsWithFormat("H:|-8-[v0]-8-|", views: self.inputTex)
        self.messageContainer.addConstarintsWithFormat("V:|[v0]|", views: self.inputTex)
        
        self.autoSetPositionOnKeyboardAppear()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        
    }

}
