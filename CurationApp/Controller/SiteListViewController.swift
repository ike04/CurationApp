//
//  SiteListViewController.swift
//  CurationApp
//
//  Created by 池田一成 on 2020/07/24.
//  Copyright © 2020 池田一成. All rights reserved.
//

import UIKit

class SiteListViewController: UIViewController {
    
    private let screenWidth = Int(UIScreen.main.bounds.size.width)
    private let screenHeight = Int(UIScreen.main.bounds.size.height)
    
    private let tableView: UITableView = UITableView()
    
    private var sites: [Site] = [Site]()
    
    private lazy var siteTableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 120, width: self.view.frame.width, height: self.view.frame.height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(R.nib.siteCell)
        tableView.rowHeight = 120
        tableView.separatorColor = UIColor.gray
        return tableView
    }()
    
    private lazy var addBarButton: UIBarButtonItem = {
        let saveBarButton =  UIBarButtonItem(barButtonSystemItem: .add,
                                             target: self,
                                             action: #selector(didAddBarButtonTapped(_:)))
        
        return saveBarButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSites()
        view.addSubview(siteTableView)
        
    }
    
    @objc private func didAddBarButtonTapped(_ sender: UIBarButtonItem) {
        // TODO
    }
    
    private func setupSites() {
        sites = [Site(icon: R.image.image1()!,
                      title: "サンプルタイトル")]
    }
}

extension SiteListViewController: UITableViewDelegate {
    /// セル選択時（UITableViewDataSource optional）
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        // TODO
    }
}

extension SiteListViewController: UITableViewDataSource {
    //セクション数設定
    func numberOfSections(in sampleTableView: UITableView) -> Int {
        return 1
    }
    //表示するcellの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sites.count
    }
    
    //cellのコンテンツ
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.siteCell, for: indexPath) else { return UITableViewCell() }
        cell.setCell(site: sites[indexPath.row])
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
}
