//
//  TableViewController.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 19/08/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    private let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: self.cellID)
        
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.didSwipe(_:)))
            recognizer.direction = UISwipeGestureRecognizerDirection.Right
        self.tableView?.addGestureRecognizer(recognizer)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellID) as! TableViewCell
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    func didSwipe(recognizer: UIGestureRecognizer) {
        if recognizer.state == UIGestureRecognizerState.Ended {
            let swipeLocation = recognizer.locationInView(self.tableView)
            if let swipedIndexPath = self.tableView?.indexPathForRowAtPoint(swipeLocation) {
                if let swipedCell = self.tableView?.cellForRowAtIndexPath(swipedIndexPath) {
                    UIView.animateWithDuration(0.2, animations: {
                        let cell = swipedCell as! TableViewCell
                            cell.container.frame = CGRectMake(UIScreen.mainScreen().bounds.width, 0, cell.frame.width, cell.frame.height)
                    })
                }
            }
        }
    }
}
