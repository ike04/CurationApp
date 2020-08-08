//
//  SiteDetailsViewController.swift
//  CurationApp
//
//  Created by 池田一成 on 2020/07/27.
//  Copyright © 2020 池田一成. All rights reserved.
//

import UIKit

class SiteDetailsViewController: UIViewController {
    
    private var selectedSite: Site?
    
    private var imageView = UIImageView()
    
    private lazy var contextLabel:UILabel = {
        let textView = UILabel()
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNavigation()
        setupLayout()
    }
    
    // MARK: - Navigation
    private func getNavigation() {
        self.navigationItem.title = selectedSite?.title
    }
    
    func inject(selectedSite: Site) {
        self.selectedSite = selectedSite
    }
    
    private func setupLayout() {
        [imageView, contextLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        // プレビュー画像
        imageView.image = selectedSite?.previewImage
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        // 本文
        contextLabel.text = selectedSite?.context
        contextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contextLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120).isActive = true
        contextLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        contextLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        // TODO
    }
}
