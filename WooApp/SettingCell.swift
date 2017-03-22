//
//  SettingCell.swift
//  WooApp
//
//  Created by Mohan on 3/22/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCellForSetting(indexPath:IndexPath){
        lblTitle.text = Constants.SettingListItem[indexPath.row]
    }
    
}
