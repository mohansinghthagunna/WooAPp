//
//  SideMenuViewModel.swift
//  WooApp
//
//  Created by Mohan on 3/20/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import Foundation

class SideMenuViewModel{
    private let menuItemData = [["title":"STORE",
                                 "image":"",
                                 "index":"1"],
                                ["title":"CATEGORIES",
                                 "image":"2",
                                 "index":"2"],
                                ["title":"CART",
                                 "image":"3",
                                 "index":"3"],
                                ["title":"SETTINGS",
                                 "image":"4",
                                 "index":"4"],
                                ["title":"LOGIN",
                                 "image":"5",
                                 "index":"5"]]

    func getMenuValue(at Index:Int)->(menuTitle:String,menuImageIcon:String){
        if Index == 0{
             return ("HI THERE!","")
        }
        return (menuItemData[Index - 1]["title"]!,menuItemData[Index - 1]["image"]!)
    }
}
