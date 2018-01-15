//
//  NikoBarcode.swift
//  Niko
//
//  Created by Maahi on 22/07/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit


let kCatTypeEnabled = "kCatTypeEnabled"

class NikoBarcode: KeyboardViewController , NikoBannerDelegate {
    
    

    
    
    let takeDebugScreenshot: Bool = false
    var loadItemView:Bool = false
    

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        UserDefaults.standard.register(defaults: [kCatTypeEnabled: true])
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    
    
    
    func takeScreenshotDelay() {
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(NikoBarcode.takeScreenshot), userInfo: nil, repeats: false)
    }
    
    func takeScreenshot() {
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
    
    
   
    
    func openKCoin(){
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        print("Main App sandbox \(paths)")
        
        
        // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "themes123.jpeg")!)
        
        /*  let frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)//(x:0, y:0,Width: self.view.frame.size.width,Height: self.view.frame.size.height)
         let backgroundImage = UIImageView(frame: frame)
         backgroundImage.image = UIImage(named: "themes123.jpeg")
         self.view.insertSubview(backgroundImage, at: 0)*/
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
    
    func openURL(_ url: URL) {
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
    
    //Delegate method
    
    func openMenu() {
        
    }
    
    func openLogo() {
        
    }
    
   
    @objc func settingClick(){
        
    }
    
    @objc func historyClick(){
        
    }
    
    @objc func BarcodeClick(){
       
        self.openApp("NikoBarcode://?KeyWordProduct=Barcode")
       // NikoUrlSchemaKeye
    }
    
    @objc  func bookMarkClick(){
        
    }
}
