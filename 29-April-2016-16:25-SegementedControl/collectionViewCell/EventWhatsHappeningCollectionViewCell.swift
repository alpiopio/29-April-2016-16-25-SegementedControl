//
//  EventWhatsHappeningCollectionViewCell.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 29/06/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class EventWhatsHappeningCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: GotixEventsViewModel? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("Happening")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.registerNibs()
    }

}

extension EventWhatsHappeningCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    private func registerNibs() {
        let happeningNib: UINib = UINib(nibName: "WhatsHappeningCollectionViewCell", bundle: nil)
        self.collectionView?.registerNib(happeningNib, forCellWithReuseIdentifier: "cellHello")
        
        let exploreMoreNib: UINib = UINib(nibName: "ExploreMoreItemCollectionViewCell", bundle: nil)
        self.collectionView?.registerNib(exploreMoreNib, forCellWithReuseIdentifier: "cellExplore")
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = self.viewModel?.gotixEventsModel?.count {
            return count+1
        }
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let count = self.viewModel?.gotixEventsModel?.count {
            if indexPath.item == count {
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellExplore", forIndexPath: indexPath) as! ExploreMoreItemCollectionViewCell
                    cell.layer.borderColor = UIColor.groupTableViewBackgroundColor().CGColor
                    cell.layer.borderWidth = 1
                    cell.layer.cornerRadius = 5
                return cell
            } else {
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellHello", forIndexPath: indexPath) as! WhatsHappeningCollectionViewCell
                    cell.layer.borderColor = UIColor.groupTableViewBackgroundColor().CGColor
                    cell.layer.borderWidth = 1
                    cell.layer.cornerRadius = 5
                
                    if let model = self.viewModel?.gotixEventsModel {
                        cell.model = model[indexPath.row]
                    }
                return cell
            }
        }
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellHello", forIndexPath: indexPath) as! WhatsHappeningCollectionViewCell
            cell.layer.borderColor = UIColor.groupTableViewBackgroundColor().CGColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 5
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = UIScreen.mainScreen().bounds.width-36
        
        return CGSizeMake(width, collectionView.frame.height-2)
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = (scrollView.contentOffset.x + (UIScreen.mainScreen().bounds.width/2)) / (UIScreen.mainScreen().bounds.width-26)
        if let count = self.viewModel?.gotixEventsModel?.count {
            if floor(page) >= 0 && floor(page) <= CGFloat(count) {
                UIView.animateWithDuration(5, animations: {
                    print("alfian")
                    scrollView.setContentOffset(CGPointMake((UIScreen.mainScreen().bounds.width-26)*floor(page), 0), animated: true)
                })
            }
        }
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let page = (scrollView.contentOffset.x + (UIScreen.mainScreen().bounds.width/2)) / (UIScreen.mainScreen().bounds.width-26)
        if let count = self.viewModel?.gotixEventsModel?.count {
            if floor(page) >= 0 && floor(page) <= CGFloat(count) {
                UIView.animateWithDuration(5, animations: {
                    print("alfian2")
                    scrollView.setContentOffset(CGPointMake((UIScreen.mainScreen().bounds.width-26)*floor(page), 0), animated: true)
                })
            }
        }
    }
    
//    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        let page = (scrollView.contentOffset.x + (UIScreen.mainScreen().bounds.width/2)) / (UIScreen.mainScreen().bounds.width-26)
//        if let count = self.viewModel?.gotixEventsModel?.count {
//            if floor(page) >= 0 && floor(page) <= CGFloat(count) {
//                UIView.animateWithDuration(0, animations: {
//                    print("alfian2")
//                    scrollView.setContentOffset(CGPointMake((UIScreen.mainScreen().bounds.width-26)*floor(page), 0), animated: true)
//                })
//            }
//        }
//    }
    
//    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        let page = (scrollView.contentOffset.x + (UIScreen.mainScreen().bounds.width/2)) / (UIScreen.mainScreen().bounds.width-26)
//        scrollView.setContentOffset(CGPointMake((UIScreen.mainScreen().bounds.width-26)*floor(page), 0), animated: true)
//    }
    
}