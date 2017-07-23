//
//  NikoBanner.swift
//  Niko
//
//  Created by Maahi on 22/07/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit


protocol KEETTOOBannerDelegate {
    
    func openMenu()
    func openLogo()
    func openContainerAppWithAdd(_ urlString : String)
}

class NikoBanner: ExtraView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
    // MARK:- Delegate
    var delegate:KEETTOOBannerDelegate?
    var reqCalledSts = false
    var btnLogo :UIButton = UIButton()
    var btnMenu :UIButton = UIButton()
    var animationView :UIView = UIView()
    var btnAddLogo :UIButton = UIButton()
    
    var latitude = 0.0
    var langitude = 0.0
    var catSwitch: UISwitch = UISwitch()
    var catLabel: UILabel = UILabel()
    var suggetionview  :UIView = UIView()
    var menuClick :Bool = false
    
    required init(globalColors: GlobalColors.Type?, darkMode: Bool, solidColorMode: Bool) {
        super.init(globalColors: globalColors, darkMode: darkMode, solidColorMode: solidColorMode)
        
        /* self.addSubview(self.catSwitch)
         self.addSubview(self.catLabel)
         
         self.catSwitch.isOn = UserDefaults.standard.bool(forKey: kCatTypeEnabled)
         self.catSwitch.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
         self.catSwitch.addTarget(self, action: #selector(KEETTOOBanner.respondToSwitch), for: UIControlEvents.valueChanged)
         */
        
        
        
        
        self.addSubview(self.btnLogo)
        self.addSubview(self.btnMenu)
        self.addSubview(self.animationView)
        
        self.updateAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        
        self.btnAddLogo.frame.origin = CGPoint(x:(self.frame.size.width - 130), y: 0)//(self.frame.size.width - 130)
        self.btnAddLogo.frame.size.height = 30
        self.btnAddLogo.frame.size.width = 30
        //        let imageAdd = UIImage(named: "logo.png")
        //        btnAddLogo.setImage(imageAdd, for: .normal)//(image, for: .normal)
        self.btnAddLogo.addTarget(self, action: #selector(openAddvertisement), for: .touchUpInside)
        self.animationView.addSubview(self.btnAddLogo)
        
        self.animationView.frame.origin = CGPoint(x: 40, y: 5)
        self.animationView.frame.size.height = 30
        self.animationView.frame.size.width = (self.frame.size.width - 80)
        
        self.btnLogo.frame.origin = CGPoint(x: (self.frame.size.width - 45), y: 4)
        self.btnLogo.frame.size.height = 36
        self.btnLogo.frame.size.width = 36
        let image = UIImage(named: "logo.png")
        btnLogo.setImage(image, for: .normal)//(image, for: .normal)
        self.btnLogo.addTarget(self, action: #selector(clickLogo), for: .touchUpInside)
        self.bringSubview(toFront: self.btnLogo)
        
        
        self.btnMenu.frame.origin = CGPoint(x: 5, y: 4)
        self.btnMenu.frame.size.height = 36
        self.btnMenu.frame.size.width = 36
        self.btnMenu.tintColor = .blue
        
        let image2 = UIImage(named: "menu.png")
        btnMenu.setImage(image2, for: .normal)
        // btnMenu.backgroundColor = UIColor.green
        self.btnMenu.addTarget(self, action: #selector(clickMenu), for: .touchUpInside)
        
        
        
        //http://www.mastersoftwaresolutions.com/ios-8-third-party-keyboards-using-app-extension/
        
        suggetionview.frame = CGRect (x: 0, y: 0, width: (self.frame.size.width - 80), height: self.frame.size.height)
        suggetionview.backgroundColor = .white
        suggetionview.isHidden = true
        self.addSubview(self.suggetionview)
        
    }
    
    //    func respondToSwitch() {
    //        UserDefaults.standard.set(self.catSwitch.isOn, forKey: kCatTypeEnabled)
    //        self.updateAppearance()
    //    }
    //
    func updateAppearance() {
        if self.catSwitch.isOn {
            self.catLabel.text = "😺"
            self.catLabel.alpha = 1
        }
        else {
            self.catLabel.text = "🐱"
            self.catLabel.alpha = 0.5
        }
        
        self.catLabel.sizeToFit()
    }
    
    
    
    func clickMenu()  {
        
        if menuClick {
            menuClick = false
            let image2 = UIImage(named: "menu.png")
            btnMenu.setImage(image2, for: .normal)
        }else{
            menuClick = true
            let image2 = UIImage(named: "keyboard.png")
            btnMenu.setImage(image2, for: .normal)
        }
        
        
        
        delegate?.openMenu()
    }
    
    func clickLogo()  {
        print("ClickLogo")
        // self.backgroundColor = UIColor.yellow
        delegate?.openLogo()
    }
    
    
    func openAddvertisement() {
        
        
        
        
    }
    
    
    
  


}
