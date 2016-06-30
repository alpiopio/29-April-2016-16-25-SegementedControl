//
//  EstimatedHeightProtocol.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 26/06/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

protocol EstimatedHeigthProtocol {
    
}

extension EstimatedHeigthProtocol {
    func estimatedFrame(message: String = "", offset: CGFloat = 0, font: UIFont = UIFont.systemFontOfSize(12)) -> CGRect {
        let size = CGSizeMake(UIScreen.mainScreen().bounds.width - offset, 1000)
        let options = NSStringDrawingOptions.UsesFontLeading.union(.UsesLineFragmentOrigin)
        
        let estimatedHeight = NSString(string: message).boundingRectWithSize(size, options: options, attributes: [NSFontAttributeName: font], context: nil)
        
        return estimatedHeight
    }
}

extension UIViewController {
    func autoSetPositionOnKeyboardAppear() {
        self.view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(keyboardDismiss)))
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardAppear), name: UIKeyboardWillShowNotification, object: nil)
    }
    
    func keyboardAppear(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue()
            
            self.view.center = CGPointMake((UIScreen.mainScreen().bounds.width/2), (UIScreen.mainScreen().bounds.height/2) - (keyboardFrame?.height)!)
        }
    }
    
    func keyboardDismiss() {
        UIView.animateWithDuration(0.5) {
            self.view.endEditing(true)
            self.view.center = CGPointMake((UIScreen.mainScreen().bounds.width/2), (UIScreen.mainScreen().bounds.height/2))
        }
    }
}