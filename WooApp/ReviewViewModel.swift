//
//  ReviewViewModel.swift
//  WooApp
//
//  Created by Mohan on 3/22/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import Foundation
class ReviewViewModel {
    
    let testMenuItem = ["MEN","WOMEN","OTHERS"]
    let testSubCategory = ["itemA","itemB asd fasdfsad fasd fsad fsadfasfasfsdfsdfsdfsafsafsfasdfsadfasdfsadfsafasfasdfsadfsfasfsfasdfsdfsdfsdfsdfsdfsdf","itemC"]
    
    
    //MARK:- Public functions
    func getFavList(At Index:Int)->(Name:String,Image:String,ReviewText:String){
        
            return (testMenuItem[Index],"test",testSubCategory[Index])
     
    }
    
    func getTotalNumberOfItems() -> Int{
            return testMenuItem.count
    }
}

//MARK:- Private Funstions
extension ReviewViewModel{
    
}
