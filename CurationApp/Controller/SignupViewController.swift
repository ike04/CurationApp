//
//  SignupViewController.swift
//  CurationApp
//
//  Created by 池田一成 on 2020/07/23.
//  Copyright © 2020 池田一成. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    private lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        let attributedPlaceholder = NSAttributedString(string: "ユーザー名",
                                                       attributes: [NSAttributedString.Key.paragraphStyle: centeredParagraphStyle]
        )
        textField.attributedPlaceholder = attributedPlaceholder
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        let attributedPlaceholder = NSAttributedString(string: "email",
                                                       attributes: [NSAttributedString.Key.paragraphStyle: centeredParagraphStyle]
        )
        textField.attributedPlaceholder = attributedPlaceholder
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        let attributedPlaceholder = NSAttributedString(string: "password",
                                                       attributes: [NSAttributedString.Key.paragraphStyle: centeredParagraphStyle]
        )
        textField.attributedPlaceholder = attributedPlaceholder
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var passwordConfirmTextField: UITextField = {
        let textField = UITextField()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        let attributedPlaceholder = NSAttributedString(string: "password confirm",
                                                       attributes: [NSAttributedString.Key.paragraphStyle: centeredParagraphStyle]
        )
        textField.attributedPlaceholder = attributedPlaceholder
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var saveBarButton: UIBarButtonItem = {
        let saveBarButton =  UIBarButtonItem(title: "登録",
                                             style: .plain,
                                             target: self,
                                             action: #selector(didSaveBarButtonTapped(_:)))
        
        return saveBarButton
    }()
    
    private lazy var closeBarButton: UIBarButtonItem = {
        let closeBarButton =  UIBarButtonItem(title: "閉じる",
                                              style: .plain,
                                              target: self,
                                              action: #selector(didCloseBarButtonTapped(_:)))
        
        return closeBarButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNavigation()
        setupLayout()
    }
    
    private func setupLayout() {
        [userNameTextField, emailTextField, passwordTextField, passwordConfirmTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        // ユーザー名
        userNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userNameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        userNameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userNameTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        // メールアドレス
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -140).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        // パスワード
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        // 確認パスワード
        passwordConfirmTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordConfirmTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20).isActive = true
        passwordConfirmTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordConfirmTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    // NavigatinBar
    private func getNavigation() {
        self.navigationItem.title = "Sign up"
        
        navigationItem.setRightBarButton(saveBarButton, animated: true)
        navigationItem.setLeftBarButton(closeBarButton, animated: true)
    }
    
    @objc private func didSaveBarButtonTapped(_ sender: UIBarButtonItem) {
        //TODO
    }
    
    @objc private func didCloseBarButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
