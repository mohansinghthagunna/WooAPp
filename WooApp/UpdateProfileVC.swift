//
//  UpdateProfileVC.swift
//  WooApp
//
//  Created by Mohan on 3/23/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import UIKit

class UpdateProfileVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heightTableViewConstants: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName:"SettingCell",bundle:nil), forCellReuseIdentifier: "TableCell")
       
    }

   
}

//MARK:- table delegates
extension UpdateProfileVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heightTableViewConstants.constant = CGFloat(Constants.AccountSettingListItem.count) * 74
        return Constants.AccountSettingListItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! SettingCell
        cell.configureCellForUpdateProfile(indexPath:indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.row {
        case 0:
            let changePassVC = ChangePasswordVC()
            self.navigationController?.pushViewController(changePassVC, animated: true)
            break
        case 1:
            let wishListVC = WishListVC()
            self.navigationController?.pushViewController(wishListVC, animated: true)
            break
        case 2:
            let billingAddress = BillingAddressVC()
            self.navigationController?.pushViewController(billingAddress, animated: true)
            break
        case 3:
            let orderHistoryVC = OrderHistoryVC()
            self.navigationController?.pushViewController(orderHistoryVC, animated: true)
            break
        default:
            break
        }
        (self.navigationController as! CustomNavigationController).pushViewController()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
}
