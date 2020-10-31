//
//  UIAlertExtension.swift
//  CurationApp
//
//  Created by 池田一成 on 2020/07/27.
//  Copyright © 2020 池田一成. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: R.string.localizable.okay(),
                                      style: .default))
        
        present(alert, animated: true)
    }
    
    func showAlertSecondlyButton(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: R.string.localizable.okay(),
                                      style: .default,
                                      handler: handler))
        
        alert.addAction(UIAlertAction(title: R.string.localizable.cancel(),
                                      style: .cancel,
                                      handler: nil))
        
        self.present(alert, animated: true)
    }
}
