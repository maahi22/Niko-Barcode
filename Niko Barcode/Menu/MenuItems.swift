//
//  MenuItems.swift
//  Niko Barcode
//
//  Created by Apple on 17/01/18.
//  Copyright © 2018 Maahi. All rights reserved.
//

import UIKit



private let reuseIdentifier = "MenuCollCell"


protocol MenuItemsDelegate {
    func openItemsNumber(_ index : Int)
}






class MenuItems: UIViewController {

    
    @IBOutlet weak var collectionItems: UICollectionView!
    var itemsList = NSMutableArray()
    var delegate:MenuItemsDelegate?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var dict = ["title" : "Uber" , "image":"keyboardIconUber.png"]
        itemsList.add(dict)
        dict = ["title" : "Zomato" , "image":"zomato.jpg"]
        itemsList.add(dict)
        dict = ["title" : "Notes" , "image":"keyboardIconNotes.png"]
        itemsList.add(dict)
        dict = ["title" : "Smileys" , "image":"keyboardIconSmileyes.png"]
        itemsList.add(dict)
        dict = ["title" : "google Search" , "image":"googleSearchIcon.png"]
        itemsList.add(dict)
        dict = ["title" : "SMS" , "image":"keyboardIconSMS.png"]
        itemsList.add(dict)
        dict = ["title" : "Dialogues" , "image":"keyboardIconDialouges.png"]
        itemsList.add(dict)
        dict = ["title" : "Stickers" , "image":"keyboardIconStickers.png"]
        itemsList.add(dict)
        dict = ["title" : "Calculator" , "image":"keyboardIconCalculator.png"]
        itemsList.add(dict)
        dict = ["title" : "Themes" , "image":"keyboardIconThemes.png"]
        itemsList.add(dict)
        dict = ["title" : "Settings" , "image":"keyboardIconSettings.png"]
        itemsList.add(dict)
        dict = ["title" : "Reminder" , "image":"alarm.png"]
        itemsList.add(dict)
        dict = ["title" : "kCoin Account" , "image":"KeettooCoin.png"]
        itemsList.add(dict)
        dict = ["title" : "My Account" , "image":"keyboardWallet.png"]
        itemsList.add(dict)
        dict = ["title" : "Edit" , "image":"keyboardEditMenu.png"]
        itemsList.add(dict)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}




extension MenuItems : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return itemsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:MenuCollCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MenuCollCell
        
        //if cell is MenuCollCell {
            
            cell.backgroundColor = UIColor.white
            let item = itemsList[indexPath.item] as! NSDictionary
          
            let image:UIImage = UIImage(named:item["image"] as! String)!//"zomato.jpg")!
            cell.imageView.image = image;
            cell.lblTitle.text = item["title"] as? String
            
            
       // }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 60
        let collectionCellSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionCellSize/3, height: collectionCellSize/3)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.openItemsNumber(indexPath.item)
    }

}
