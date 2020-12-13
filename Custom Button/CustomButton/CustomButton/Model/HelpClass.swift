//
//  DateHelpClass.swift
//  CCIC
//
//  Created by ACN-LPT279 on 9/2/18.
//  Copyright © 2018 ACN. All rights reserved.
//

import Foundation
import UIKit

class HelpClass  {
    
    
    
    enum colorID :String {
        case id1 = "#a1c4fdff"
        case id2 = "#13547aff"
        case id3 = "#ffecd2ff"
        case id4 = "#ff9a9eff"
        case id5 = "#cfd9dfff"
        case id6 = "#89f7feff"
    }
    
    
    static func getColorID() -> colorID.Type {
        return colorID.self
    }
    
    
    static func isNotNullorEmpty(source:String?) -> Bool{
        
        if (source == nil)
        {
            return false
        }
        if (source == "")
        {
            return false
        }
        
        return true
    }
    
    
    static func shouldReturnDiffernt(text:String?, from:String?) -> String?
    {
        if (isNotNullorEmpty(source: text))
        {
            if (isNotNullorEmpty(source: from))
            {
                if (from == text)
                {
                    return nil
                }
                else
                {
                    return text
                }
            }
            else
            {
                return text
            }
        }
        
        return nil
    }
    

    
    static func okALert(title:String , message:String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(actionOK)
        return alertController
    }
    
    
    static func getLetterImage(type:String) -> UIImage{
        let lblNameInitialize = UILabel()
        lblNameInitialize.frame.size = CGSize(width: 50.0, height: 50.0)
        lblNameInitialize.textColor = UIColor.white
        lblNameInitialize.text = type
        lblNameInitialize.textAlignment = NSTextAlignment.center
        lblNameInitialize.backgroundColor = UIColor.lightGray
        lblNameInitialize.layer.cornerRadius = 50.0
        UIGraphicsBeginImageContext(lblNameInitialize.frame.size)
        lblNameInitialize.layer.render(in: UIGraphicsGetCurrentContext()!)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    
    static func getAccessoryImageView(image:String, color: UIColor) -> UIImageView{
        let imageView : UIImageView
        imageView  = UIImageView(frame:CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.image = UIImage(named: image)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor.red
        return imageView
    }
    
    
    

    
}

