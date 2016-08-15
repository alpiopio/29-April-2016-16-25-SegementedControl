//
//  HomeEvents.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 27/06/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class HomeEvents: UIView {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: GotixEventsViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}