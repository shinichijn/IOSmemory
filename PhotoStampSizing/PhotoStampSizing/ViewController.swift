//
//  ViewController.swift
//  PhotoStampSizing
//
//  Created by Chris Nie on 12/19/20.
//  Copyright © 2020 JINGNIE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var photoButton: UIButton!
    
    @IBOutlet weak var desc: UILabel!
    
    var imageData:NSData?
    
    
    
    
    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.white
        let textFont = UIFont(name: "Helvetica Bold", size: 60)!
        
        //let scale = UIScreen.main.scale
        let scale = image.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let textFontAttributes = [
            NSAttributedStringKey.font: textFont,
            NSAttributedStringKey.foregroundColor: textColor,
            ] as [NSAttributedStringKey : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        var newSize: CGSize
        newSize = CGSize(width: targetSize.width, height: targetSize.height)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    
    func convertImage(image: UIImage) -> UIImage
    {
        return  self.resizeImage(image: image, targetSize: CGSize(width:1200, height:1000))
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            let timestamp = localDate(date: Date())
            let convert = convertImage(image: image)
            let textImage = textToImage(drawText: timestamp, inImage: convert, atPoint: CGPoint(x: 800, y: 800))
            let imgData: NSData = NSData(data: UIImageJPEGRepresentation(textImage, 0.5)!)
            imageData = imgData
            self.image.image = UIImage(data: imageData as! Data)
            let size = ["Original Height is \(image.size.width)",
                        "Original Height is \(image.size.height)",
                "Convert Height is \(self.image.image!.size.width)",
                "Convert Height is \(self.image.image!.size.height)"]
                .joined(separator: "\n")
            desc.text = size
            
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func photoAction(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
        
        
    }
    
    
    func localDate(date : Date) -> String
    {
        //let dateFormatterPickup = ISO8601DateFormatter()
        //let datePickup = dateFormatterPickup.date(from:date)
        let dateformatterPickup = DateFormatter()
        dateformatterPickup.dateFormat = "MM/dd/yyyy"
        dateformatterPickup.timeZone = TimeZone.current
        let  newDatePickup = dateformatterPickup.string(from: date)
        let pickDate = newDatePickup
        return pickDate
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

