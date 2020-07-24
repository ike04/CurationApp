//
//  SiteCell.swift
//  CurationApp
//
//  Created by 池田一成 on 2020/07/24.
//  Copyright © 2020 池田一成. All rights reserved.
//

import UIKit

class SiteCell: UITableViewCell {

    @IBOutlet weak var siteImage: UIImageView!
    @IBOutlet weak var siteTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(site: Site) {
        siteImage.image = site.icon
        siteTitleLabel.text = site.title
    }
    
}
