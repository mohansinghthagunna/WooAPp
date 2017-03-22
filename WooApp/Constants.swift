//
//  Constants.swift
//  WooApp
//
//  Created by Mohan on 3/20/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import Foundation

struct Constants {
    //MARK:- Single Heirarchy Variables
    static let AppName = "WooApp"
    
    //MARK:- TABLE LIST ARRAYS
    static let SideMenuItem = [["title":"STORE",
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
    static let SettingListItem = ["ACCOUNT INFORMATIONS","FAQ","LANGUAGE","CONTACT US","RATE THE APP"]

    
    //MARK:- Nav titles
    struct NavigationTitleEng{
        static let homeParent = "HOME"
        static let Categories = "CATEGORY"
        static let MyCart = "MY CART"
        static let Setting = "SETTING"
        static let ItemDetails = "DETAILS"
    }
    
    //MARK:- User Defaults
    struct UserDefault{
        static let Language = "Language"
    }
}
