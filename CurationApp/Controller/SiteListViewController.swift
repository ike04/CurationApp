//
//  SiteListViewController.swift
//  CurationApp
//
//  Created by 池田一成 on 2020/07/24.
//  Copyright © 2020 池田一成. All rights reserved.
//

import UIKit

class SiteListViewController: UIViewController {
    
    private lazy var addBarButton: UIBarButtonItem = {
        let saveBarButton =  UIBarButtonItem(barButtonSystemItem: .add,
                                             target: self,
                                             action: #selector(didAddBarButtonTapped(_:)))
        
        return saveBarButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNavigation()
    }
    
    // MARK: - Navigation
    private func getNavigation() {
        self.navigationItem.title = R.string.localizable.siteList()
        
        navigationItem.setRightBarButton(addBarButton, animated: true)
    }
    
    @objc private func didAddBarButtonTapped(_ sender: UIBarButtonItem) {
        //TODO
    }
    
}
