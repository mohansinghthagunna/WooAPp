//
//  MyCartListVC.swift
//  WooApp
//
//  Created by Mohan on 3/20/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MyCartListVC: UIViewController,IndicatorInfoProvider {
    
    @IBOutlet weak var tableView: UITableView!
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
        tableView.register(UINib(nibName:"MyCartListCellTableViewCell",bundle:nil), forCellReuseIdentifier: "TableCell")
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
  
}

//MARK:- Table View Delegates
extension MyCartListVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! MyCartListCellTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        self.navigationController?.pushViewController(HomeParentVC(parent:ParentVCFor.ItemDetails), animated: true)
        (self.navigationController as! CustomNavigationController).pushViewController()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
}
