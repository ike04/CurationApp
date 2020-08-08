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
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(logoutButtonEvent(_:)), for: UIControl.Event.touchUpInside)
        button.setTitle(R.string.localizable.logout(), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.sizeToFit()
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 0, green: 122 / 255, blue: 1, alpha: 1)
        button.center = view.center
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNavigation()
        setupLayout()
        // TODO
    }
    
    // MARK: - Navigation
    private func getNavigation() {
        self.navigationItem.title = R.string.localizable.account()
    }
    
    private func setupLayout() {
        [logoutButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        // ログアウト
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        // TODO
    }
    
    @objc private func logoutButtonEvent(_ sender: UIButton) {
        showAlertSecondlyButton(title: R.string.localizable.logout(), message: R.string.localizable.logoutMessage()) { (UIAlertAction) in
            //TODO
            let nextView = R.storyboard.login.instantiateInitialViewController()!
            nextView.modalPresentationStyle = .fullScreen
            self.navigationController?.present(nextView, animated: true)//遷移する
        }
    }
}
