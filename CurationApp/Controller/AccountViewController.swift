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
    private var users: [User] = [User]()
    
    // MARK: - Propaties
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(logoutButtonEvent(_:)), for: .touchUpInside)
        button.setTitle(R.string.localizable.logout(), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.setTitleColor(UIColor.white, for: .normal)
        button.sizeToFit()
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 0, green: 122 / 255, blue: 1, alpha: 1)
        button.center = view.center
        return button
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.userName()
        return label
    }()
    
    private lazy var loginUserNameLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 0.5
        label.layer.cornerRadius = 5.0
        label.layer.borderColor = UIColor.darkGray.cgColor
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.email()
        return label
    }()
    
    private lazy var loginEmailLabel: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 0.5
        label.layer.cornerRadius = 5.0
        label.layer.borderColor = UIColor.darkGray.cgColor
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // テスト用データ
        users = [User(userName: "TestUser",
                      email: "test@example.com")]
        
        getNavigation()
        setupLayout()
    }
    
    // MARK: - Navigation
    private func getNavigation() {
        self.navigationItem.title = R.string.localizable.account()
    }
    
    // MARK: - Auto Layout
    private func setupLayout() {
        [userNameLabel, loginUserNameLabel, emailLabel, loginEmailLabel, logoutButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        // ユーザー名
        userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20).isActive = true
        userNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        userNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        
        // ログインユーザー名
        loginUserNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20).isActive = true
        loginUserNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        loginUserNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        loginUserNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        loginUserNameLabel.text = users[0].userName
        
        // メールアドレス
        emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20).isActive = true
        emailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emailLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        
        // ログインメールアドレス
        loginEmailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20).isActive = true
        loginEmailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        loginEmailLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        loginEmailLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        loginEmailLabel.text = users[0].email
        
        // ログアウト
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    @objc private func logoutButtonEvent(_ sender: UIButton) {
        showAlertSecondlyButton(title: R.string.localizable.logout(),
                                message: R.string.localizable.logoutMessage()) { [weak self] _ in
                                    let nextView = R.storyboard.login.instantiateInitialViewController()!
                                    nextView.modalPresentationStyle = .fullScreen
                                    self?.navigationController?.present(nextView, animated: true)
        }
    }
}
