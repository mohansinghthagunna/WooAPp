//
//  CaegoryViewModel.swift
//  WooApp
//
//  Created by Mohan on 3/22/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import Foundation

class CategoryViewModel {
    
    let testMenuItem = ["MEN","WOMEN","OTHERS"]
    let testSubCategory = ["itemA","itemB","itemC","itemD","itemE","itemF","itemG","itemH","itemI","itemJ","itemK"]
    
    //MARK:- Declarations
    var isCategory = true
    
    //MARK:- Init constructor
    init(isCategory:Bool) {
        self.isCategory = isCategory
    }
    
    //MARK:- Public functions
    func getCategorList(At Index:Int)->(Title:String,Image:String){
        if isCategory{
            return (testMenuItem[Index],"test")
        }
        else{
            return (testSubCategory[Index],"test")
        }
    }
    
    func getTotalNumberOfItems() -> Int{
        if isCategory{
            return testMenuItem.count
        }
        else{
            return testSubCategory.count
        }
    }
}

//MARK:- Private Funstions
extension CategoryViewModel{
    
}
