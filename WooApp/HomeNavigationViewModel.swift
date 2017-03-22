//
//  HomeNavigationViewModel.swift
//  WooApp
//
//  Created by Mohan on 3/21/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import Foundation

class HomeNavigationViewModel {
    var title:String?
    
    func humBurgerAnimation(isReverse:Bool){
        
    }
    
    func getNavTitle(vc CurrentVC:UIViewController) -> String?{
        if (((CurrentVC.isKind(of: HomeParentVC.self))) && (CurrentVC as! HomeParentVC).parentVC == ParentVCFor.Home)
        {
            return Constants.NavigationTitleEng.homeParent
        }
        else if (((CurrentVC.isKind(of: HomeParentVC.self))) && (CurrentVC as! HomeParentVC).parentVC == ParentVCFor.ItemDetails)
        {
            return Constants.NavigationTitleEng.ItemDetails
        }
        else if (((CurrentVC.isKind(of: HomeParentVC.self))) && (CurrentVC as! HomeParentVC).parentVC == ParentVCFor.MyCart)
        {
            return Constants.NavigationTitleEng.MyCart
        }
        else if (((CurrentVC.isKind(of: CategoryVC.self))))
        {
            return Constants.NavigationTitleEng.Categories
        }
//        else if (((CurrentVC.isKind(of: HomeParentVC.self))))
//        {
//            return Constants.NavigationTitleEng.homeParent
//        }
//        else if (((CurrentVC.isKind(of: HomeParentVC.self))))
//        {
//            return Constants.NavigationTitleEng.homeParent
//        }
//        else if (((CurrentVC.isKind(of: HomeParentVC.self))))
//        {
//            return Constants.NavigationTitleEng.homeParent
//        }
        else{
            return Constants.AppName
        }
    }
    
    
}
