//
//  File.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 30/04/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class SecondViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellID = "cellID"
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.title = "Dribble"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        self.collectionView?.alwaysBounceVertical = true
        
        self.collectionView?.registerClass(secondCell.self, forCellWithReuseIdentifier: self.cellID)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        
    }
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueReusableCellWithReuseIdentifier(self.cellID, forIndexPath: indexPath)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(self.view.frame.width, 100)
    }
    
}

class secondCell: UICollectionViewCell {
    
    override var highlighted: Bool {
        didSet {
            self.backgroundColor = self.highlighted ? UIColor(red: 0, green: 134/255, blue: 249/255, alpha: 1) : UIColor(white: 0.9, alpha: 0.5)
            self.titleLabel.textColor = self.highlighted ? UIColor.whiteColor() : UIColor.blackColor()
            self.messageLabel.textColor = self.highlighted ? UIColor.whiteColor() : UIColor.grayColor()
            self.timeLabel.textColor = self.highlighted ? UIColor.whiteColor() : UIColor.grayColor()
        }
    }
    
    let image: UIImageView = {
        let image = UIImageView()
            image.contentMode = .ScaleAspectFit
            image.layer.cornerRadius = 25
            image.layer.masksToBounds = true
        
        return image
    }()
    
    let divederLine: UIView = {
        let dividerLine = UIView()
            dividerLine.backgroundColor = UIColor(white: 0.9, alpha: 0.5)
        
        return dividerLine
    }()
    
    let container: UIView = {
        let container = UIView()
            container.backgroundColor = UIColor.clearColor()
        
        return container
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
            titleLabel.text = "Muhammad Alfiansyah"
            titleLabel.textColor = UIColor.blackColor()
            titleLabel.font = UIFont.systemFontOfSize(14, weight: 0.2)
        
        return titleLabel
    }()
    
    let timeLabel: UILabel = {
        let timeLabel = UILabel()
            timeLabel.text = "14:30"
            timeLabel.textColor = UIColor.grayColor()
            timeLabel.font = UIFont.systemFontOfSize(12, weight: 0.2)
            timeLabel.textAlignment = .Right
        
        return timeLabel
    }()
    
    let messageLabel: UILabel = {
        let messageLabel = UILabel()
            messageLabel.text = "SegementedControl[39068:565410] Simulator user has requested new graphics quality: 10"
            messageLabel.textColor = UIColor.grayColor()
            messageLabel.font = UIFont.systemFontOfSize(12)
            messageLabel.lineBreakMode = .ByTruncatingTail
            messageLabel.numberOfLines = 0
        
        return messageLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(self.image)
        self.addSubview(self.divederLine)
        self.addSubview(self.container)
        
        self.container.addSubview(self.titleLabel)
        self.container.addSubview(self.messageLabel)
        self.container.addSubview(self.timeLabel)
        
        self.image.image = UIImage(named: "profile")
        self.image.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstarintsWithFormat("H:|-12-[v0(50)]", views: self.image)
        self.addConstarintsWithFormat("V:[v0(50)]", views: self.image)
        
        self.addConstarintsWithFormat("H:|-0-[v0]-0-|", views: self.divederLine)
        self.addConstarintsWithFormat("V:[v0(1)]-0-|", views: self.divederLine)
        
        self.addConstarintsWithFormat("H:|-12-[v0]-12-[v1]-12-|", views: self.image, self.container)
        self.addConstarintsWithFormat("V:|-12-[v0]-12-|", views: self.container)
        
//        self.addConstarintsWithFormat("H:|[v0]|", views: self.titleLabel)
        self.addConstarintsWithFormat("V:|[v0][v1]|", views: self.titleLabel, self.messageLabel)
        self.addConstarintsWithFormat("H:|[v0]|", views: self.messageLabel)
        
        self.addConstarintsWithFormat("H:|[v0][v1]|", views: self.titleLabel, self.timeLabel)
        self.addConstarintsWithFormat("V:|[v0][v1]|", views: self.timeLabel, self.messageLabel)
        
        self.addConstraint(NSLayoutConstraint(item: self.image, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
        
        self.backgroundColor = UIColor(red: (250/255), green: (250/255), blue: (250/255), alpha: 1)
    }
    
}