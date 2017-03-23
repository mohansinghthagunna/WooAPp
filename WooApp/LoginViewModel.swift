//
//  LoginViewModel.swift
//  WooApp
//
//  Created by Mohan on 3/23/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import Foundation

class LoginViewModel{
    
    func loginUserWith(userName:String,password:String,onCompletion:@escaping(_ isLogin:Bool)->()){
        UserDefaults.standard.set(true, forKey: Constants.UserDefault.IsLogin)
        UserDefaults.standard.synchronize()
        onCompletion(true)
    }
    
}
