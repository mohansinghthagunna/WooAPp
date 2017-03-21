//
//  CustomNavigationController.swift
//  WooApp
//
//  Created by Mohan on 3/16/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    var objHomeNavBar = HomeNavigationBar()
    var isBurgerMenu = true
    override func viewDidLoad() {
        super.viewDidLoad()
       setNavigationBarHidden(true, animated: false)
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setRevealElement()
        setupNavigationBar()
    }

}

//MARK:- Custom Funations
extension CustomNavigationController{
    func setRevealElement(){
        self.revealViewController().rearViewRevealWidth = 200
        self.revealViewController().delegate = self
         self.revealViewController().clipsViewsToBounds = false
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    func setupNavigationBar(){
            objHomeNavBar.delegate = self
            objHomeNavBar.sideMenuState(flag: false)
            self.view.addSubview(objHomeNavBar)
    }
    
    func updateNavigationBar(){
        if self.viewControllers.count > 1{
            self.popViewController(animated: true)
            objHomeNavBar.updateView(vc: self.visibleViewController!)
            if self.viewControllers.count == 1{
              sideMenuClosed()
            }
        }
        else{
          self.revealViewController().revealToggle(animated: true)
        }
    }
    
    func sideMenuOpen(){
       // viewNavigationBar?.customBurgerMenuView.addBurgerCrossAnimationAnimation()
        objHomeNavBar.sideMenuState(flag: true)
        let mainVC = (self.revealViewController().frontViewController as! UINavigationController).visibleViewController
        mainVC?.view.isUserInteractionEnabled = false
    }
    
    func sideMenuClosed(){
          objHomeNavBar.sideMenuState(flag: false)
        let mainVC = (self.revealViewController().frontViewController as! UINavigationController).visibleViewController
        mainVC?.view.isUserInteractionEnabled = true
    }
    
    func pushViewController(){
        if self.viewControllers.count == 2{
        objHomeNavBar.sideMenuState(flag: true)
        }
    }
    

}

//MARK:- Home navigation bar delegates
extension CustomNavigationController:homeNavBarDelegates{
    func btnSideMenuTapped() {
         updateNavigationBar()
    }
}

//MARK:- SWReveal View Controller delegates
extension CustomNavigationController:SWRevealViewControllerDelegate{
    func revealController(_ revealController: SWRevealViewController!, willMoveTo position: FrontViewPosition) {
        switch(position){
  
        case FrontViewPosition.left:
            print("Left")
            //Closed
            sideMenuClosed()
            break
            
        case FrontViewPosition.right:
            print("Right")
            //Opened
            sideMenuOpen()
            break
        default:
            break
            
        }
    }
}
