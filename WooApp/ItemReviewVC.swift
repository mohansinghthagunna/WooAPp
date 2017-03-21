//
//  ItemReviewVC.swift
//  WooApp
//
//  Created by Mohan on 3/21/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ItemReviewVC: UIViewController ,IndicatorInfoProvider {
    
    //MARK:- Outlets
    
    
    //MARK:- declarations
    var itemInfo: IndicatorInfo = "View"
    var isParent = true
    
    //MARK:- vc Property
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
