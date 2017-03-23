//
//  LoginVC.swift
//  WooApp
//
//  Created by Mohan on 3/23/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
//MARK:- Outlets
    
    @IBOutlet weak var txtUserEmail: UITextField!
    @IBOutlet weak var txtUserPassword: UITextField!
    
    
//MARK:- Declarations
    let loginVMObj = LoginViewModel()
    
    
//MARK:- VC Property
    override func viewDidLoad() {
        super.viewDidLoad()

    }

//MARK:- Button Actions
    @IBAction func btnLoginTapped(_ sender: Any) {
        let userEmail = txtUserEmail.text ?? "test"
        let userPassword = txtUserPassword.text ?? "test"
        loginVMObj.loginUserWith(userName: userEmail, password: userPassword,onCompletion: {(isLogin:Bool) in
            if isLogin{
                let profileVC = UpdateProfileVC()
                self.navigationController?.setViewControllers([profileVC], animated: true)
            }
            })
    }
    
    @IBAction func btnRegisterTapped(_ sender: Any) {
      _ =  self.navigationController?.pushViewController(RegisterVC(), animated: true)
        (self.navigationController as! CustomNavigationController).pushViewController()
    }
    
    @IBAction func btnForgotPasswordTapped(_ sender: Any) {
       _ =  self.navigationController?.pushViewController(ForgotPasswordVC(), animated: true)
        (self.navigationController as! CustomNavigationController).pushViewController()
    }
    
    
}
