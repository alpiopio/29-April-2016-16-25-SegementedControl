//
//  EventExploreCollectionViewCell.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 29/06/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class EventExploreCollectionViewCell: UICollectionViewCell {

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
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.registerNibs()
    }

}

extension EventExploreCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    private func registerNibs() {
        let exploreNib: UINib = UINib(nibName: "ExploreItemCollectionViewCell", bundle: nil)
        self.collectionView?.registerNib(exploreNib, forCellWithReuseIdentifier: "cellHello")
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = self.viewModel?.gotixEventsModel?.count {
            return count
        }
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellHello", forIndexPath: indexPath) as! ExploreItemCollectionViewCell
        
            if let model = self.viewModel?.gotixEventsModel {
                cell.model = model[indexPath.row]
            }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.width*(125/375))
    }
    
}