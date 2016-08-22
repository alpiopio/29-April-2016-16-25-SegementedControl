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
            firstControllerNavigation.tabBarItem.title = "Home"
            firstControllerNavigation.tabBarItem.image = UIImage(named: "home")
        
        let secondController = SecondViewController(collectionViewLayout: layout)
        let secondControllerNavigation = UINavigationController(rootViewController: secondController)
            secondControllerNavigation.tabBarItem.title = "Chat"
            secondControllerNavigation.tabBarItem.image = UIImage(named: "bubble-chat")
        
        let thirdController = HomeViewController()
        let thirdControllerNavigation = UINavigationController(rootViewController: thirdController)
            thirdControllerNavigation.tabBarItem.title = "Gotix"
            thirdControllerNavigation.tabBarItem.image = UIImage(named: "shopping-cart-add")
        
        let fourthController = TableViewController()
        let fourthControllerNavigation = UINavigationController(rootViewController: fourthController)
            fourthControllerNavigation.tabBarItem.title = "Table"
            fourthControllerNavigation.tabBarItem.image = UIImage(named: "briefcase")
        
        self.viewControllers = [firstControllerNavigation, secondControllerNavigation, thirdControllerNavigation, fourthControllerNavigation]
    }

}
