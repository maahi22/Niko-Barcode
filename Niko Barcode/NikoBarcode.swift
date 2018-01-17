//
//  NikoBarcode.swift
//  Niko
//
//  Created by Maahi on 22/07/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit


let kCatTypeEnabled = "kCatTypeEnabled"

class NikoBarcode: KeyboardViewController, NikoBannerDelegate, MenuItemsDelegate {
    
    
    let takeDebugScreenshot: Bool = false
    var loadItemView:Bool = false
    var itemsView :MenuItems = MenuItems()
    
    

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        UserDefaults.standard.register(defaults: [kCatTypeEnabled: true])
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
         self.view.backgroundColor  = .green
       // self.bannerView?.delegate = self
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*override   func loadView() {
        super.loadView()
        
        if let aBanner = self.createBanner() {
            aBanner.isHidden = true
            self.view.insertSubview(aBanner, belowSubview: self.forwardingView)
            self.bannerView = aBanner as? NikoBanner
            
            
        }
    }*/
    
    
    override func keyPressed(_ key: Key) {
        let textDocumentProxy = self.textDocumentProxy
        
        let keyOutput = key.outputForCase(self.shiftState.uppercase())
        
        if !UserDefaults.standard.bool(forKey: kCatTypeEnabled) {
            textDocumentProxy.insertText(keyOutput)
            return
        }
        
        if key.type == .character || key.type == .specialCharacter {
            if let context = textDocumentProxy.documentContextBeforeInput {
                if context.characters.count < 2 {
                    textDocumentProxy.insertText(keyOutput)
                    return
                }
                
                var index = context.endIndex
                
                index = context.index(before:index)// Collection.index(before: index)
                if context[index] != " " {
                    textDocumentProxy.insertText(keyOutput)
                    return
                }
                
                index = context.index(before:index)//Collection.index(before: index)
                if context[index] == " " {
                    textDocumentProxy.insertText(keyOutput)
                    return
                }
                
                //Mahendra      textDocumentProxy.insertText("\(randomCat())")
                //Mahendra     textDocumentProxy.insertText(" ")
                textDocumentProxy.insertText(keyOutput)
                return
            }
            else {
                textDocumentProxy.insertText(keyOutput)
                return
            }
        }
        else {
            textDocumentProxy.insertText(keyOutput)
            return
        }
    }
    
    override func setupKeys() {
        super.setupKeys()
        
        if takeDebugScreenshot {
            if self.layout == nil {
                return
            }
            
            for page in keyboard.pages {
                for rowKeys in page.rows {
                    for key in rowKeys {
                        if let keyView = self.layout!.viewForKey(key) {
                            keyView.addTarget(self, action: #selector(NikoBarcode.takeScreenshotDelay), for: .touchDown)
                            //keyView.addTarget(self, action: "takeScreenshotDelay", for: .touchDown)
                        }
                    }
                }
            }
        }
        
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        print("Main App sandbox \(paths)")
        
       
        
        
    }
    
    override func createBanner() -> ExtraView? {
        let nikoBanner = NikoBanner(globalColors: type(of: self).globalColors, darkMode: false, solidColorMode: self.solidColorMode())
        nikoBanner.delegate = self
        nikoBanner.backgroundColor = UIColor.hexStringToUIColor(hex: NikoBannerColor)
        nikoBanner.backgroundColor?.withAlphaComponent(0.7)
        return nikoBanner
    }
    
    
    
    
    @objc func takeScreenshotDelay() {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(NikoBarcode.takeScreenshot), userInfo: nil, repeats: false)
    }
    
    @objc func takeScreenshot() {
        if !self.view.bounds.isEmpty {
            UIDevice.current.beginGeneratingDeviceOrientationNotifications()
            
            let oldViewColor = self.view.backgroundColor
            self.view.backgroundColor = UIColor(hue: (216/360.0), saturation: 0.05, brightness: 0.86, alpha: 1)
            
            let rect = self.view.bounds
            UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
            var context = UIGraphicsGetCurrentContext()
            self.view.drawHierarchy(in: self.view.bounds, afterScreenUpdates: true)
            let capturedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            let name = (self.interfaceOrientation.isPortrait ? "Screenshot-Portrait" : "Screenshot-Landscape")
            let imagePath = "/Users/archagon/Documents/Programming/OSX/RussianPhoneticKeyboard/External/tasty-imitation-keyboard/\(name).png"
            
            if let pngRep = UIImagePNGRepresentation(capturedImage!) {
                try? pngRep.write(to: URL(fileURLWithPath: imagePath), options: [.atomic])
            }
            
            self.view.backgroundColor = oldViewColor
        }
    }
    
    
    
    
    
    
    func removeItemView()  {
        loadItemView = false
        
    }
    
   
    
    
  
    
    
    //Calculator Delegate methods
    func sendTextfieldValue(_ value : String){
        print(value)
        textDocumentProxy.insertText(value)
        //calculatorVC.txtField = nil
    }
    
    //Smile View Delegate method
    func typeSmilesIcon(_ value : String){
        textDocumentProxy.insertText(value)
    }
    func deleteIcon(){
        textDocumentProxy.deleteBackward()
    }
    
    func sendTextVC(_ value : String){
        
        
        
    }
    
    
    
    
    //*******http://jayeshkawli.ghost.io/ios-custom-url-schemes/
    //****** Banner Buttons
    func openContainerAppWithAdd(_ urlString : String){
        
        openApp(urlString)
    }
    
    
    //Schema open
    
    func openApp(_ urlstring:String) {
        var responder: UIResponder? = self
        let selector = #selector(openURL(_:))
        while responder != nil {
            if responder!.responds(to: selector) && responder != self {
                responder!.perform(selector, with: URL(string: urlstring)!)
                return
            }
            responder = responder?.next
        }
    }
    
    @objc func openURL(_ url: URL) {
        return
    }
    
    
    
    
    
    
    //Message and Diloge Delegates
    func sendTextBack(_ dilog : String){
        textDocumentProxy.insertText(dilog)
    }
    
    func sendMSGTextBack(_ value : String){
        textDocumentProxy.insertText(value)
        
    }
    
    func cancelMsgText (_ lastText : String){
        if let documentContext = self.textDocumentProxy.documentContextBeforeInput { // Make sure that it isn't nil
            if documentContext.isEmpty == false { // I guess you need false?
                // Do what you want with non-empty document context
                //documentContext.removeRange
                var Str = documentContext
                textDocumentProxy.insertText(Str)
                //Str.removeRange(Str.startIndex..<Str.startIndex.advancedBy(20))
            }
        }
        
    }
    
    //Banner Delegate methods INSERTING SUGGETIONS
    func InsertSuggetionText(_ suggetionText : String){
        
        if let documentContext = self.textDocumentProxy.documentContextBeforeInput { // Make sure that it isn't nil
            if documentContext.isEmpty == false { // I guess you need false?
                // Do what you want with non-empty document context
                let srt = documentContext.lastWord
                for i in srt.characters{
                    textDocumentProxy.deleteBackward()
                }
            }
        }
        textDocumentProxy.insertText(suggetionText)
    }
    
    
    
    
    
    //Menues items
    func loadItemsView() {
        loadItemView = true
        
       /* let mainStoryBoard = UIStoryboard(name: "MenuItems", bundle: nil)
        itemsView = mainStoryBoard.instantiateViewController(withIdentifier: "MenuItems") as! MenuItems
        
        itemsView.view.frame.origin = CGPoint(x: 0, y: metric("topBanner"))
        itemsView.view.frame.size.height = 300//(self.view.frame.size.height - metric("topBanner"))
        itemsView.view.frame.size.width = 300//self.view.frame.size.width
        itemsView.delegate = self
        self.view.addSubview(itemsView.view)*/
        
        self.view.backgroundColor = .red
    }
    
    //On Menu Click calles Delegate methods
    func openItemsNumber(_ index : Int){
    
        
    }
    //Delegate method
    
    func openMenu() {
        
        if loadItemView {
            loadItemView = false
            
            if self.view.subviews.contains(itemsView.view) {
                itemsView.view.removeFromSuperview()
            }
            
            
        }else{
            loadItemView = true
            self.loadItemsView()
        }
        
    }
    
    func openLogo() {
        
    }
    
   
    @objc func settingClick(){
        self.view.backgroundColor  = .green
    }
    
    @objc func historyClick(){
        
    }
    
    @objc func BarcodeClick(){
       
        textDocumentProxy.insertText("Hi Niko")
        self.bannerView?.backgroundColor = .green
        
        self.openApp("NikoBarcode://?KeyWordProduct=Barcode")
       // NikoUrlSchemaKeye
    }
    
    @objc  func bookMarkClick(){
        
    }
}
