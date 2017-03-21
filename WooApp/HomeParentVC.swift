//
//  HomeParentVC.swift
//  WooApp
//
//  Created by Mohan on 3/16/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class HomeParentVC: ButtonBarPagerTabStripViewController {

    var parentVC:ParentVCFor?
    
    init(parent:ParentVCFor) {
        super.init(nibName: nil, bundle: nil)
        parentVC = parent
    }
    
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = .lightGray
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 12)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor =  UIColor(red: 68.0/255.0, green: 68.0/255.0, blue: 68.0/255.0, alpha: 1)
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor =  UIColor(red: 68.0/255.0, green: 68.0/255.0, blue: 68.0/255.0, alpha: 1)
            newCell?.label.textColor =  UIColor(red: 68.0/255.0, green: 68.0/255.0, blue: 68.0/255.0, alpha: 1)
        }
        super.viewDidLoad()
        // signUpForNotifications()
    }

    // MARK: - PagerTabStripDataSource
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        switch parentVC! {
        case .Home:
            let child_1 = StoreHomeVC( itemInfo: "STORE")
            let child_2 = CategoryVC(itemInfo: "CATEGORIES")
            return [child_1, child_2]
        case .ItemDetails:
            let child_1 = ItemDetailVC( itemInfo: "DETAILS")
            let child_2 = ItemReviewVC(itemInfo: "REVIEW")
            let child_3 = SimilarItemsVC(itemInfo: "SIMILAR")
            return [child_1, child_2, child_3]
        case .MyCart:
            let child_1 = MyCartListVC( itemInfo: "MY CART")
            let child_2 = CartCouponVC(itemInfo: "COUPON")
            let child_3 = CartTotalAmountVC(itemInfo: "TOTAL AMOUNT")
            return [child_1, child_2, child_3]
        }
      
    }

}
