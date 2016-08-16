//
//  HomeMovies.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 27/06/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit
import AVFoundation

class HomeMovies: UIView {
    @IBOutlet weak var placeButton: UIButton!
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var videoPlayer: UIView!
    
    private var collectionViewController: MoviesColectionviewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configure()
        
        let urlString = "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
        if let url = NSURL(string: urlString) {
            let player = AVPlayer(URL: url)
            let playerLayer = AVPlayerLayer(player: player)
            self.videoPlayer.layer.addSublayer(playerLayer)
            playerLayer.frame = self.videoPlayer.frame
            
            player.play()
        }
    }
    
    private func configure() {
        self.configureBannerView()
        self.configurePlaceButton()
        self.congfigureMoviesCollectionView()
        
        self.collectionViewController = MoviesColectionviewController(collectionView: self.moviesCollectionView)
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
