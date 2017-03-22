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
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- declarations
    var itemInfo: IndicatorInfo = "View"
    let reviewViewModelObj = ReviewViewModel()
    
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
        tableView.register(UINib(nibName:"ReviewCell",bundle:nil), forCellReuseIdentifier: "TableCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 83
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}

//MARK:- Table View Delegates
extension ItemReviewVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewViewModelObj.getTotalNumberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! ReviewCell
        cell.configureCellForeReview(At: indexPath, reviewViewModelObj: reviewViewModelObj)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 83
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
}
