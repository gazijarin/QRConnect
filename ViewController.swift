//
//  ViewController.swift
//  QRConnect
//
//  Created by Gazi on 2018-10-27.
//  Copyright © 2018 Gazi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var qrImage: UIImageView!
    
    @IBAction func generateBtn(_ sender: Any)
    {
        if let myString = textInput.text
        {
            let data = myString.data(using: .ascii, allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "inputMessage")
            
            let ciImage = filter?.outputImage
            
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let transformImage = ciImage?.transformed(by: transform)
            
            let image = UIImage(ciImage: transformImage!)
            
            qrImage.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

