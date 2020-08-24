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
        let vc2 = SiteListViewController()
        let vc3 = SiteListViewController()
        let vc4 = SiteListViewController()
        
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
        var alertTextField: UITextField?
        
        let alert = UIAlertController(
            title: R.string.localizable.addDialogTitle(),
            message: R.string.localizable.addDialogMessage(),
            preferredStyle: UIAlertController.Style.alert)
        alert.addTextField(
            configurationHandler: {(textField: UITextField!) in
                alertTextField = textField
                
        })
        alert.addAction(
            UIAlertAction(
                title: R.string.localizable.cancel(),
                style: UIAlertAction.Style.cancel,
                handler: nil))
        
        alert.addAction(
            UIAlertAction(
                title: R.string.localizable.okay(),
                style: UIAlertAction.Style.default) { [weak self] _ in
                    if let text = alertTextField?.text {
                        if let error = self?.getError(url: text) {
                            self?.showAlert(title: R.string.localizable.inputError(),
                                            message: error.message)
                            return
                        }
                        
                        // TODO
                    }
            }
        )
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Validation
    func getError(url: String) -> UIErrorType? {
        guard !url.isEmpty  else {
            return .emptyUrl
        }
        return nil
    }
}
