//
//  SideMenuViewModel.swift
//  WooApp
//
//  Created by Mohan on 3/20/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import Foundation

class SideMenuViewModel{
   
    func getMenuValue(at Index:Int)->(menuTitle:String,menuImageIcon:String){
        if Index == 0{
            if isLogin(){
                return("Mohan Singh Thagunna","test")
            }
             return (Constants.SideMenu.userName,GetFile.Image.userName)
        }
        
        if Index == getTotalNumberOfItem(){
            if isLogin(){
                return(Constants.SideMenu.logout,GetFile.Image.logout)
            }
        }
        return (Constants.SideMenuItem[Index - 1]["title"]!,Constants.SideMenuItem[Index - 1]["image"]!)
    }
    
    func getTotalNumberOfItem()->Int{
        return Constants.SideMenuItem.count
    }
    
    func isLogin()->Bool{
        if let isUserLogin = UserDefaults.standard.value(forKey: Constants.UserDefault.IsLogin){
            return (isUserLogin as! Bool)
        }
        return false
    }
    
    func logout(){
        UserDefaults.standard.removeObject(forKey: Constants.UserDefault.IsLogin)
    }

}
