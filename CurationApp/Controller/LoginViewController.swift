//
//  ViewController.swift
//  CurationApp
//
//  Created by 池田一成 on 2020/07/22.
//  Copyright © 2020 池田一成. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private struct Const {
        static let maxTextFieldLength: Int = 6
    }
    
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.placeholder = R.string.localizable.email()
            emailTextField.clearButtonMode = .always
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.placeholder = R.string.localizable.password()
            passwordTextField.clearButtonMode = .always
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.setTitle(R.string.localizable.login(), for: .normal)
            loginButton.setTitleColor(UIColor.white, for: .normal)
            loginButton.backgroundColor = UIColor.systemBlue
            loginButton.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var signupButton: UIButton! {
        didSet {
            signupButton.setTitle(R.string.localizable.signup(), for: UIControl.State.normal)
            signupButton.setTitleColor(UIColor.white, for: .normal)
            signupButton.backgroundColor = UIColor.systemBlue
            signupButton.layer.cornerRadius = 10
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didLoginButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text
            else { return }
        
        if let error = getError(email: email, password: password) {
            showAlert(title: R.string.localizable.inputError(),
                      message: error.message)
            return
        }
        
        let mainTabBarController = MainTabBarController()
        mainTabBarController.modalPresentationStyle = .fullScreen
        present(mainTabBarController, animated: false)
    }
    
    @IBAction func didSignupTapped(_ sender: Any) {
        let signupViewController: UIViewController = SignupViewController()
        let signupView = UINavigationController(rootViewController: signupViewController)
        self.present(signupView, animated: true)
    }
    
    // MARK: - Validation
    func getError(email: String, password: String) -> UIErrorType? {
        guard !email.isEmpty && !password.isEmpty else {
            return .empty
        }
        
        guard password.count >= Const.maxTextFieldLength else {
            return .count
        }
        return nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
