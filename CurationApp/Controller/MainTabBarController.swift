//
//  MainTabBarController.swift
//  CurationApp
//
//  Created by 池田一成 on 2020/07/24.
//  Copyright © 2020 池田一成. All rights reserved.
//

import UIKit
import TabPageViewController

final class MainTabBarController: UITabBarController {
    
    private lazy var addBarButton: UIBarButtonItem = {
        let saveBarButton =  UIBarButtonItem(barButtonSystemItem: .add,
                                             target: self,
                                             action: #selector(didAddBarButtonTapped(_:)))
        
        return saveBarButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabPageViewController = TabPageViewController.init()
        let vc1 = SiteListViewController()
        let vc2 = UIViewController()
        let vc3 = UIViewController()
        let vc4 = UIViewController()
        
        tabPageViewController.tabItems = [(vc1, "ALL"), (vc2, "Category1"), (vc3, "Category2"), (vc4, "Category3")]
        tabPageViewController.isInfinity = true
        tabPageViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let accountViewController: UIViewController = AccountViewController()
        accountViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        let myTabs = NSArray(objects: UINavigationController(rootViewController: tabPageViewController), accountViewController)
        tabPageViewController.navigationItem.title = R.string.localizable.siteList()
        tabPageViewController.navigationItem.setRightBarButton(addBarButton, animated: true)
        setViewControllers(myTabs as? [UIViewController], animated: true)
    }
    
    @objc private func didAddBarButtonTapped(_ sender: UIBarButtonItem) {
        //TODO
    }
}
