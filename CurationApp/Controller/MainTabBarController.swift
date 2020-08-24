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
    let tabPageViewController = TabPageViewController.init()
    let accountViewController: UIViewController = AccountViewController()
    
    private lazy var addBarButton: UIBarButtonItem = {
        let saveBarButton =  UIBarButtonItem(barButtonSystemItem: .add,
                                             target: self,
                                             action: #selector(didAddBarButtonTapped(_:)))
        
        return saveBarButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabPageView()
        setupMainTabView()
    }
    
    private func setupTabPageView() {
        let vc1 = SiteListViewController()
        let vc2 = UIViewController()
        let vc3 = UIViewController()
        let vc4 = UIViewController()
        
        tabPageViewController.tabItems = [(vc1, R.string.localizable.all()),
                                          (vc2, R.string.localizable.category1()),
                                          (vc3, R.string.localizable.category2()),
                                          (vc4, R.string.localizable.category3())]
        
        tabPageViewController.isInfinity = true
        tabPageViewController.option.tabHeight = 30.0
    }
    
    private func setupMainTabView() {
        tabPageViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        accountViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        let myTabs = NSArray(objects: UINavigationController(rootViewController: tabPageViewController),
                             UINavigationController(rootViewController: accountViewController)
        )
        
        tabPageViewController.navigationItem.title = R.string.localizable.siteList()
        tabPageViewController.navigationItem.setRightBarButton(addBarButton, animated: true)
        setViewControllers(myTabs as? [UIViewController], animated: true)
    }
    
    @objc private func didAddBarButtonTapped(_ sender: UIBarButtonItem) {
        let okAction: ((UIAlertAction) -> Void)? = { _ in
            // TODO
        }
        showAlertText(title: R.string.localizable.addDialogTitle(),
                      message: R.string.localizable.addDialogMessage(),
                      handler: okAction)
    }
    
}
