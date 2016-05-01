//
//  TabBarViewController.swift
//  29-April-2016-16:25-SegementedControl
//
//  Created by alfian on 30/04/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        
        let firstController = FirstViewController()
        let firstControllerNavigation = UINavigationController(rootViewController: firstController)
            firstControllerNavigation.tabBarItem.title = "First"
            firstControllerNavigation.tabBarItem.image = UIImage(named: "calendar")
        
        let secondController = SecondViewController(collectionViewLayout: layout)
        let secondControllerNavigation = UINavigationController(rootViewController: secondController)
            secondControllerNavigation.tabBarItem.title = "Second"
            secondControllerNavigation.tabBarItem.image = UIImage(named: "calendar")
        
        self.viewControllers = [firstControllerNavigation, secondControllerNavigation]
    }

}
