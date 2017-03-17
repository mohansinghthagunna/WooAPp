//
//  SideMenuVC.swift
//  WooApp
//
//  Created by Mohan on 3/17/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName:"SideMenuTableCell",bundle:nil), forCellReuseIdentifier: "TableCell")
    }

}


extension SideMenuVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! SideMenuTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.row {
        case 0:
            break
        case 1:
            let mainVC = self.revealViewController().frontViewController as! UINavigationController
            if !((mainVC.visibleViewController?.isKind(of: HomeParentVC.self))!)
            {
                mainVC.setViewControllers([HomeParentVC()], animated: true)
            }
            break
            
        case 2:
            let mainVC = self.revealViewController().frontViewController as! UINavigationController
            if !((mainVC.visibleViewController?.isKind(of: CategoryVC.self))!)
            {
                mainVC.setViewControllers([CategoryVC()], animated: true)
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
