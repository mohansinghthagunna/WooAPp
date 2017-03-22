//
//  SideMenuVC.swift
//  WooApp
//
//  Created by Mohan on 3/17/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {
    //MARK:- Declarations
    let sideMenuItem = [["title":"STORE",
                         "image":"",
                         "login":false],
                        ["title":"CATEGORIES",
                         "image":"",
                         "login":false],
                        ["title":"CART",
                         "image":"",
                         "login":false],
                        ["title":"SETTINGS",
                         "image":"",
                         "login":false],
                        ["title":"LOGIN",
                         "image":"",
                         "login":false]]
    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK:- VC Property
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName:"SideMenuTableCell",bundle:nil), forCellReuseIdentifier: "TableCell")
    }

}


extension SideMenuVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideMenuItem.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! SideMenuTableCell
        let data = SideMenuViewModel().getMenuValue(at: indexPath.row)
        cell.configureCellForMenu(title: data.menuTitle, image:  data.menuImageIcon)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch indexPath.row {
        case 0:
            break
        case 1:
            let mainVC = self.revealViewController().frontViewController as! UINavigationController
            if (!((mainVC.visibleViewController?.isKind(of: HomeParentVC.self))!) || (mainVC.visibleViewController as! HomeParentVC).parentVC != ParentVCFor.Home)
            {
                mainVC.setViewControllers([HomeParentVC(parent:ParentVCFor.Home)], animated: true)
            }
            break
            
        case 2:
            let mainVC = self.revealViewController().frontViewController as! UINavigationController
            if !((mainVC.visibleViewController?.isKind(of: CategoryVC.self))!)
            {
                mainVC.setViewControllers([CategoryVC()], animated: true)
            }
            break
        case 3:
            let mainVC = self.revealViewController().frontViewController as! UINavigationController
            if (!((mainVC.visibleViewController?.isKind(of: HomeParentVC.self))!) || (mainVC.visibleViewController as! HomeParentVC).parentVC != ParentVCFor.MyCart)
            {
                mainVC.setViewControllers([HomeParentVC(parent:ParentVCFor.MyCart)], animated: true)
            }
            else{
                
            }
            break
        case 4:
            let mainVC = self.revealViewController().frontViewController as! UINavigationController
            if !((mainVC.visibleViewController?.isKind(of: SettingVC.self))!)
            {
                mainVC.setViewControllers([SettingVC()], animated: true)
            }
            break

        default:
            
            break
        }

        revealViewController().rightRevealToggle(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
}
