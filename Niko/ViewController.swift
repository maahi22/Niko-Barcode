//
//  ViewController.swift
//  Niko
//
//  Created by Maahi on 22/07/17.
//  Copyright © 2017 Maahi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let storyboard = UIStoryboard(name: "Barcode", bundle: nil)
        let barcodePage = storyboard.instantiateViewController(withIdentifier: "BarcodeScaner") as! BarcodeScaner
       // self.vi?.rootViewController?.present(barcodePage, animated: true, completion: nil)
        self.present(barcodePage, animated: true) {
        
        }
        
        print("Niko Load")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

