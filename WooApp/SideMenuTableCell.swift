//
//  SideMenuTableCell.swift
//  WooApp
//
//  Created by Mohan on 3/17/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import UIKit

class SideMenuTableCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCellForMenu(At indexPath:IndexPath , sideMenuVMObj:SideMenuViewModel){
        let data = sideMenuVMObj.getMenuValue(at: indexPath.row)
        imgIcon.image = UIImage(named:data.menuImageIcon)
        lblTitle.text = data.menuTitle
    }
    
}
