//
//  ViewController.swift
//  CustomButton
//
//  Created by Chris Nie on 12/12/20.
//  Copyright © 2020 JINGNIE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func setupButton()
    {
        
            let location: statusButton = {
                let location =  statusButton(myType: "",
                                             myDate: "SELECT LOCATION",
                                             myTime: "",
                                             myImage: "")
                location.backgroundColor = UIColor(hex: HelpClass.getColorID().id1.rawValue)
                location.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(location)
                location.topAnchor.constraint(equalTo: self.view.topAnchor, constant:40).isActive = true
                location.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:10).isActive = true
                location.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:-10).isActive = true
                location.heightAnchor.constraint(equalToConstant: 80).isActive = true
                location.date.font = UIFont.boldSystemFont(ofSize: 20.0)
                return location
            }()
            
            
            let picture: statusButton = {
                let picture =  statusButton(myType: "TAKE PICTURE",
                                            myDate: "PROFILE",
                                            myTime: "TYPE",
                                            myImage: "")
                picture.backgroundColor = UIColor(hex: HelpClass.getColorID().id2.rawValue)
                picture.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(picture)
                picture.topAnchor.constraint(equalTo: location.bottomAnchor, constant:10).isActive = true
                picture.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:10).isActive = true
                picture.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:-10).isActive = true
                picture.heightAnchor.constraint(equalToConstant: 100).isActive = true
                picture.date.font = UIFont.boldSystemFont(ofSize: 20.0)
                return picture
            }()
            
            
            let clearAction: statusButton = {
                let clearAction =  statusButton(myType: "",
                                                myDate: "CLEAR LOCATION",
                                                myTime: "",
                                                myImage: "")
                clearAction.backgroundColor = UIColor(hex: HelpClass.getColorID().id3.rawValue)
                clearAction.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(clearAction)
                clearAction.topAnchor.constraint(equalTo: picture.bottomAnchor, constant:10).isActive = true
                clearAction.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:10).isActive = true
                clearAction.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:-10).isActive = true
                clearAction.heightAnchor.constraint(equalToConstant: 80).isActive = true
                clearAction.date.font = UIFont.boldSystemFont(ofSize: 20.0)
                return clearAction
            }()
        
        
        let leftTop: statusButton = {
            let leftTop =  statusButton(myType: "Job Start",
                                        myDate: "11/12/2020",
                                        myTime: "18:23:01",
                                        myImage: "")
            leftTop.backgroundColor = UIColor(hex: HelpClass.getColorID().id1.rawValue)
            leftTop.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(leftTop)
            leftTop.topAnchor.constraint(equalTo: view.centerYAnchor, constant:20).isActive = true
            leftTop.leadingAnchor.constraint(equalTo: clearAction.leadingAnchor, constant:10).isActive = true
            leftTop.trailingAnchor.constraint(equalTo: self.view.centerXAnchor, constant:-10).isActive = true
            leftTop.heightAnchor.constraint(equalToConstant: 100).isActive = true
            return leftTop
        }()
        
        let leftBottom: statusButton = {
            let leftBottom = statusButton(myType: "Check In",
                                          myDate: "11/12/2020",
                                          myTime: "18:23:01",
                                          myImage: "")
            leftBottom.backgroundColor = UIColor(hex: HelpClass.getColorID().id2.rawValue)
            leftBottom.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(leftBottom)
            leftBottom.topAnchor.constraint(equalTo: view.centerYAnchor, constant:20).isActive = true
            leftBottom.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant:10).isActive = true
            leftBottom.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:-10).isActive = true
            leftBottom.heightAnchor.constraint(equalToConstant: 100).isActive = true
            return leftBottom
        }()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}


