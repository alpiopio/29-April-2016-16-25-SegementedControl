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
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCellWithReuseIdentifier("cellHello", forIndexPath: indexPath) as! ExploreItemCollectionViewCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.width*(120/360))
    }
    
}