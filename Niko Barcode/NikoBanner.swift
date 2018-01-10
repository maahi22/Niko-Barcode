//
//  NikoBanner.swift
//  Niko
//
//  Created by Maahi on 22/07/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit


protocol NikoBannerDelegate {
    
    func openMenu()
    func openLogo()
    func openContainerAppWithAdd(_ urlString : String)
    
    func InsertSuggetionText(_ suggetionText : String)
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
    var delegate:NikoBannerDelegate?
    var reqCalledSts = false
    var btnLogo :UIButton = UIButton()
    var btnMenu :UIButton = UIButton()
    var btnSuggetion1: UIButton = UIButton()
    var btnSuggetion2: UIButton = UIButton()
    var btnSuggetion3: UIButton = UIButton()
    
    //var animationView :UIView = UIView()
    var btnAddLogo :UIButton = UIButton()
    
    var latitude = 0.0
    var langitude = 0.0
    var catSwitch: UISwitch = UISwitch()
    var catLabel: UILabel = UILabel()
    var suggetionView  :UIView = UIView()
    var menuClick :Bool = false
    
    required init(globalColors: GlobalColors.Type?, darkMode: Bool, solidColorMode: Bool) {
        super.init(globalColors: globalColors, darkMode: darkMode, solidColorMode: solidColorMode)
        
        
        self.addSubview(self.btnLogo)
        self.addSubview(self.btnMenu)
  //      self.addSubview(self.animationView)
        
        
        self.suggetionView.frame.origin = CGPoint(x: 45, y: 0)
        self.suggetionView.frame.size.height = 40
        self.suggetionView.frame.size.width = (self.frame.size.width - 80)
        self.addSubview(self.suggetionView)
        
        
        
        //self.updateAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
    }
    
    
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
    
    
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        self.backgroundColor = .red
        
        self.suggetionView.backgroundColor = .lightGray//UIColor.hexStringToUIColor(hex: KeettooBannerColor)//.darkGray KeettooBannerColor
       /* self.btnAddLogo.frame.origin = CGPoint(x: 0, y: 1)//(self.frame.size.width - 130)
        self.btnAddLogo.frame.size.height = 40
        self.btnAddLogo.frame.size.width = 40
        self.btnAddLogo.addTarget(self, action: #selector(openAddvertisement), for: .touchUpInside)
        self.animationView.addSubview(self.btnAddLogo)
    
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        let views = ["animationView": animationView]
        let widthConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[animationView(40)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[animationView(\(self.frame.size.width - 96))]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        let horizontalConstraint = NSLayoutConstraint(item: animationView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: animationView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate(widthConstraints)
        NSLayoutConstraint.activate(heightConstraints)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
        animationView.isHidden = true
        */
        
        let btnWidth:CGFloat = (suggetionView.frame.size.width / 3)
        
        self.btnSuggetion1.frame.origin = CGPoint(x: 0, y: 0)
        self.btnSuggetion1.frame.size.height = 40
        self.btnSuggetion1.frame.size.width =  btnWidth - 2.0
        self.btnSuggetion1.backgroundColor = UIColor.hexStringToUIColor(hex: NikoBannerColor)//.lightGray
        self.btnSuggetion1.addTarget(self, action: #selector(insertSuggetionText), for: .touchUpInside)
        self.suggetionView.addSubview(self.btnSuggetion1)
        
        self.btnSuggetion2.frame.origin = CGPoint(x: btnWidth, y: 0)
        self.btnSuggetion2.frame.size.height = 40
        self.btnSuggetion2.frame.size.width = btnWidth - 2.0
        self.btnSuggetion2.addTarget(self, action: #selector(insertSuggetionText), for: .touchUpInside)
        self.btnSuggetion2.backgroundColor = UIColor.hexStringToUIColor(hex: NikoBannerColor)//.lightGray
        self.suggetionView.addSubview(self.btnSuggetion2)
        
        self.btnSuggetion3.frame.origin = CGPoint(x: (btnWidth + btnWidth), y: 0)
        self.btnSuggetion3.frame.size.height = 40
        self.btnSuggetion3.frame.size.width = btnWidth
        self.btnSuggetion3.addTarget(self, action: #selector(insertSuggetionText), for: .touchUpInside)
        self.btnSuggetion3.backgroundColor = UIColor.hexStringToUIColor(hex: NikoBannerColor)//.lightGray
        self.suggetionView.addSubview(self.btnSuggetion3)
        
        
        
        suggetionView.translatesAutoresizingMaskIntoConstraints = false
        let views1 = ["suggetionView": suggetionView]
        let widthConstraints1 = NSLayoutConstraint.constraints(withVisualFormat: "V:[suggetionView(40)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views1)
        let heightConstraints1 = NSLayoutConstraint.constraints(withVisualFormat: "H:[suggetionView(\(self.frame.size.width - 96))]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views1)
        let horizontalConstraint1 = NSLayoutConstraint(item: suggetionView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint1 = NSLayoutConstraint(item: suggetionView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate(widthConstraints1)
        NSLayoutConstraint.activate(heightConstraints1)
        NSLayoutConstraint.activate([horizontalConstraint1, verticalConstraint1])
        suggetionView.isHidden = true
        
        
        
        
        self.btnLogo.frame.origin = CGPoint(x: 0, y: 4)
        self.btnLogo.frame.size.height = 36
        self.btnLogo.frame.size.width = 36
        let image = UIImage(named: "logo.png")
        btnLogo.setImage(image, for: .normal)
        self.btnLogo.addTarget(self, action: #selector(clickLogo), for: .touchUpInside)
        
        
        
        self.btnMenu.frame.origin = CGPoint(x: 5, y: 4)
        self.btnMenu.frame.size.height = 36
        self.btnMenu.frame.size.width = 36
        self.btnMenu.tintColor = .blue
        let image2 = UIImage(named: "menu.png")
        btnMenu.setImage(image2, for: .normal)
        self.btnMenu.addTarget(self, action: #selector(clickMenu), for: .touchUpInside)
        
        
        if NikoBanner.isFullAccessGranted(){
            print("--YES")
        }else{
            print("--NO")
            return
        }
        
        
        
        
        
        
        
        
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
    
    
    
  //Load Suggetions
    func loadSuggetions(_ textString :String){
        let textChecker = UITextChecker()
        
        let partial = textString
        let completions = textChecker.completions(
            forPartialWordRange: NSRange(0..<partial.utf16.count), in: partial,
            language: "en_US")! as NSArray
        
        
        if completions.count > 0{
            
            if completions.count == 1{
                //if let sug1 = completions[0] {
                btnSuggetion1.setTitle( completions[0] as? String, for: .normal)
                // }
            }else if completions.count == 2{
                btnSuggetion1.setTitle(completions[0] as? String, for: .normal)
                btnSuggetion2.setTitle(completions[1] as? String, for: .normal)
            }else{
                btnSuggetion1.setTitle(completions[0] as? String, for: .normal)
                btnSuggetion2.setTitle(completions[1] as? String, for: .normal)
                btnSuggetion3.setTitle(completions[2] as? String, for: .normal)
                
            }
            
            
            
        }else{
            btnSuggetion1.setTitle(textString, for: .normal)
        }
        
        
        //Set button property
        btnSuggetion1.titleLabel?.minimumScaleFactor = 0.5
        btnSuggetion1.titleLabel?.numberOfLines = 1
        btnSuggetion1.titleLabel?.adjustsFontSizeToFitWidth = true
        
        btnSuggetion2.titleLabel?.minimumScaleFactor = 0.5
        btnSuggetion2.titleLabel?.numberOfLines = 1
        btnSuggetion2.titleLabel?.adjustsFontSizeToFitWidth = true
        
        btnSuggetion3.titleLabel?.minimumScaleFactor = 0.5
        btnSuggetion3.titleLabel?.numberOfLines = 1
        btnSuggetion3.titleLabel?.adjustsFontSizeToFitWidth = true
        
        //ENDED
        
        
    }

    static func isFullAccessGranted() -> Bool
    {
        if #available(iOSApplicationExtension 10.0, *)
        {
            if UIPasteboard.general.hasStrings
            {
                return  true
            }
            else if UIPasteboard.general.hasURLs
            {
                return true
            }
            else if UIPasteboard.general.hasColors
            {
                return true
            }
            else if UIPasteboard.general.hasImages
            {
                return true
            }
            else  // In case the pasteboard is blank
            {
                UIPasteboard.general.string = ""
                
                if UIPasteboard.general.hasStrings
                {
                    return  true
                }else
                {
                    return  false
                }
            }
        } else {
            // before iOS10
            return UIPasteboard.general.isKind(of: UIPasteboard.self)
        }
    }
    
    
    
//Customisation for suggetion
    public func addsuggetionView(_ str :String){
        //self.animationView.isHidden = true
        self.suggetionView.isHidden = false
        if str == ""{
            return
        }
        self.loadSuggetions(str)
    }
    
    public func removeSuggetionView(){
        //self.animationView.isHidden = false
        self.suggetionView.isHidden = true
    }
    
    
    
    //Delegate method
    @objc func insertSuggetionText(sender:UIButton) {
        if  let insertText = sender.titleLabel?.text {
            delegate?.InsertSuggetionText(insertText)
        }
    }
    
    
    
    
    
    
   
}
