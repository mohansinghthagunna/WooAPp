//
//  CategoryVC.swift
//  WooApp
//
//  Created by Mohan on 3/17/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class CategoryVC: UIViewController,IndicatorInfoProvider {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topMargin: NSLayoutConstraint!
    
    //MARK:- declarations
    var itemInfo: IndicatorInfo = "View"
    var isParent = true
    
    //MARK:- vc Property
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
       
        isParent = true
        super.init(nibName: nil, bundle: nil)
    }
    
    init(){
        
        isParent = false
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName:"CategoryTableCell",bundle:nil), forCellReuseIdentifier: "TableCell")
        if isParent{
            topMargin.constant = 0 
        }
        else{
           topMargin.constant = 50
        }
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    override func viewWillLayoutSubviews() {
        tableView.reloadData()
    }
}

//MARK:- Table View Delegates
extension CategoryVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! CategoryTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        self.navigationController?.pushViewController(CategoryVC(), animated: true)
        (self.navigationController as! CustomNavigationController).pushViewController()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 152
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
}
