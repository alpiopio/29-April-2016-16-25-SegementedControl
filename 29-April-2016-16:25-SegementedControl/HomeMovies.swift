//
//  HomeMovies.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 27/06/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class HomeMovies: UIView {
    @IBOutlet weak var placeButton: UIButton!
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configure()
    }
    
    private func configure() {
        self.configureBannerView()
        self.configurePlaceButton()
        self.congfigureMoviesCollectionView()
    }
    
    private func configureBannerView() {
        
    }
    
    private func configurePlaceButton() {
        self.placeButton.backgroundColor = UIColor.whiteColor()
        self.placeButton.layer.masksToBounds = true
        self.placeButton.layer.borderWidth = 1
        self.placeButton.layer.borderColor = UIColor.groupTableViewBackgroundColor().CGColor
        self.placeButton.layer.cornerRadius = 3
    }
    
    private func congfigureMoviesCollectionView() {
        self.moviesCollectionView.backgroundColor = UIColor.groupTableViewBackgroundColor()
    }
}
