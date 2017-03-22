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
             return ("HI THERE!","")
        }
        return (Constants.SideMenuItem[Index - 1]["title"]!,Constants.SideMenuItem[Index - 1]["image"]!)
    }
}
