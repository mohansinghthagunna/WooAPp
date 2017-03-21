//
//  HomeNavigationBar.swift
//  WooApp
//
//  Created by Mohan on 3/16/17.
//  Copyright © 2017 Mohan. All rights reserved.
//

import UIKit
protocol homeNavBarDelegates {
    func btnSideMenuTapped()
}


@IBDesignable class HomeNavigationBar: UIView {
    static var shared:UIView?
    var delegate:homeNavBarDelegates?
    var view:UIView!

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var customBurgerMenuView: CustomBurgerMenuAnimationView!
    
   init() {
         super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 70))
        self.xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func loadViewFromNib() -> UIView {
        if HomeNavigationBar.shared == nil{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "HomeNavigationBar", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        HomeNavigationBar.shared = view
        return view
        }
        else{
           return HomeNavigationBar.shared!
        }
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
    }
    
    
    override func layoutSubviews() {
        
    }
    
   //MARK:- Button Actions
    @IBAction func btnSideMenuTapped(_ sender: Any) {
        sideMenu()
    }
    

}

//MARK:- Custom Functions
extension HomeNavigationBar{
    func sideMenu(){
        delegate?.btnSideMenuTapped()
    }
    
    func sideMenuState(flag:Bool){
        customBurgerMenuView.removeAllAnimations()
        if flag{
            customBurgerMenuView.addBurgerToCrossAnimation()
            
        }
        else{
           customBurgerMenuView.addCrossToBurgerAnimation()
        }
        
    }
    
    func updateView(vc CurrentVC:UIViewController){
        
    }
}
