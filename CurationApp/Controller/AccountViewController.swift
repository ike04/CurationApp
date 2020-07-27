//
//  AccountViewController.swift
//  CurationApp
//
//  Created by 池田一成 on 2020/07/24.
//  Copyright © 2020 池田一成. All rights reserved.
//

import UIKit
import TabPageViewController

class AccountViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNavigation()
        // TODO
    }
    
    // MARK: - Navigation
    private func getNavigation() {
        self.navigationItem.title = R.string.localizable.account()
    }
}
