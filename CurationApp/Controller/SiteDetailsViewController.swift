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
        [imageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        // プレビュー画像
        imageView.image = selectedSite?.previewImage
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        // TODO
    }
}
