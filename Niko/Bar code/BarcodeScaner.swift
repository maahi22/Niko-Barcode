//
//  BarcodeScaner.swift
//  Niko
//
//  Created by Apple on 15/01/18.
//  Copyright © 2018 Maahi. All rights reserved.
//

import UIKit
import AVFoundation




class BarcodeScaner: UIViewController {

    var captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    
     let supportedCodeTypes = [AVMetadataObjectTypeUPCECode , AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode39Mod43Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeEAN8Code,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeAztecCode, AVMetadataObjectTypePDF417Code,AVMetadataObjectTypeITF14Code, AVMetadataObjectTypeDataMatrixCode , AVMetadataObjectTypeInterleaved2of5Code, AVMetadataObjectTypeQRCode]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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




extension   BarcodeScaner:AVCaptureMetadataOutputObjectsDelegate {
    
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            //messageLabel.text = "No QR code is detected"
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if supportedCodeTypes.contains(metadataObj.type) {
            // If the found metadata is equal to the QR code metadata (or barcode) then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
               // launchApp(decodedURL: metadataObj.stringValue!)
              //  messageLabel.text = metadataObj.stringValue
            }
        }
        
    }
        
}
