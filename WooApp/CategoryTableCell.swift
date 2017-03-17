//
//  CategoryTableCell.swift
//  WooApp
//
//  Created by Mohan on 3/17/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import UIKit

class CategoryTableCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var cellBGImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        cellBGImage.clipsToBounds = true
    }
    
}
