//
//  ViewController.swift
//  CurationApp
//
//  Created by 池田一成 on 2020/07/22.
//  Copyright © 2020 池田一成. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.placeholder = "email"
            emailTextField.clearButtonMode = .always
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.placeholder = "password"
            passwordTextField.clearButtonMode = .always
        }
    }
    
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.setTitle("ログイン", for: UIControl.State.normal)
            loginButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            loginButton.backgroundColor = UIColor.systemBlue
            loginButton.layer.cornerRadius = 10
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didLoginButtonTapped(_ sender: Any) {
        // TODO
    }
    
}
