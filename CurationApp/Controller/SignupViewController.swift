//
//  SignupViewController.swift
//  CurationApp
//
//  Created by 池田一成 on 2020/07/23.
//  Copyright © 2020 池田一成. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    private struct Const {
        static let maxTextFieldLength: Int = 6
        static let emailRegEx: String = "[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    }
    
    private lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        let centeredParagraphStyle = NSMutableParagraphStyle()
        let attributedPlaceholder = NSAttributedString(string: R.string.localizable.userName(),
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
        let attributedPlaceholder = NSAttributedString(string: R.string.localizable.email(),
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
        let attributedPlaceholder = NSAttributedString(string: R.string.localizable.password(),
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
        let attributedPlaceholder = NSAttributedString(string: R.string.localizable.passwordConfirm(),
                                                       attributes: [NSAttributedString.Key.paragraphStyle: centeredParagraphStyle]
        )
        textField.attributedPlaceholder = attributedPlaceholder
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var saveBarButton: UIBarButtonItem = {
        let saveBarButton =  UIBarButtonItem(title: R.string.localizable.register(),
                                             style: .plain,
                                             target: self,
                                             action: #selector(didSaveBarButtonTapped(_:)))
        
        return saveBarButton
    }()
    
    private lazy var closeBarButton: UIBarButtonItem = {
        let closeBarButton =  UIBarButtonItem(title: R.string.localizable.close(),
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
    
    // MARK: - Navigation
    private func getNavigation() {
        self.navigationItem.title = R.string.localizable.signup()
        
        navigationItem.setRightBarButton(saveBarButton, animated: true)
        navigationItem.setLeftBarButton(closeBarButton, animated: true)
    }
    
    @objc private func didSaveBarButtonTapped(_ sender: UIBarButtonItem) {
        guard let userName = userNameTextField.text,
            let email = emailTextField.text,
            let password = passwordTextField.text,
            let passwordConfirm = passwordConfirmTextField.text else { return }
        
        if let error = getError(userName: userName,
                                email: email,
                                password: password,
                                passwordConfirm: passwordConfirm) {
            showAlert(title: R.string.localizable.inputError(),
                      message: error.message)
            return
        }
        
        let mainTabBarController = MainTabBarController()
        mainTabBarController.modalPresentationStyle = .fullScreen
        present(mainTabBarController, animated: false)
    }
    
    @objc private func didCloseBarButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    // MARK: - Validation
    func getError(userName: String, email: String, password: String, passwordConfirm: String) -> UIErrorType? {
        guard !userName.isEmpty && !email.isEmpty && !password.isEmpty && !passwordConfirm.isEmpty else {
            return .empty
        }
        
        guard self.isValidEmail(email) else {
            return .emailValid
        }
        
        guard email.count >= Const.maxTextFieldLength &&
            password.count >= Const.maxTextFieldLength else {
                return .count
        }
        
        guard password == passwordConfirm else {
            return .notMatchPassword
        }
        
        return nil
    }
    
    private func isValidEmail(_ string: String) -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    Const.emailRegEx)
        
        let result = emailTest.evaluate(with: string)
        return result
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
