//
//  CategoryTableCell.swift
//  WooApp
//
//  Created by Mohan on 3/17/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import UIKit

class CategoryTableCell: UITableViewCell {

    var viewModelObj:CategoryViewModel?
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var cellBGImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        cellBGImage.clipsToBounds = true
    }
    
    func configureCellForCategory(At indexPath:IndexPath,viewModelObj:CategoryViewModel){
        self.viewModelObj = viewModelObj
        let item = viewModelObj.getCategorList(At: indexPath.row)
        lblTitle.text = item.Title
        cellBGImage.image = UIImage(named:item.Image)
    }
    
}
