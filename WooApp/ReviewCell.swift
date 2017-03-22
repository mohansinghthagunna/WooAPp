//
//  ReviewCell.swift
//  WooApp
//
//  Created by Mohan on 3/22/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var imgUserProfile: UIImageView!
    @IBOutlet weak var lblFeedback: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCellForeReview(At indexPath:IndexPath, reviewViewModelObj:ReviewViewModel){
        let item = reviewViewModelObj.getFavList(At: indexPath.row)
        
      //  lblFeedback.text = item.ReviewText
        lblUserName.text = item.Name
        let mystring = NSMutableAttributedString(string: item.ReviewText)
        lblFeedback.attributedText = mystring
        imgUserProfile.image = UIImage(named:item.Image)
    }
}
