//
//  MainTabBarController.swift
//  CurationApp
//
//  Created by 池田一成 on 2020/07/24.
//  Copyright © 2020 池田一成. All rights reserved.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let siteListNavigationController = UINavigationController(rootViewController: SiteListViewController())
        siteListNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let accountViewController: UIViewController = AccountViewController()
        accountViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        let myTabs = NSArray(objects: siteListNavigationController, accountViewController)
        setViewControllers(myTabs as? [UIViewController], animated: true)
    }
}
