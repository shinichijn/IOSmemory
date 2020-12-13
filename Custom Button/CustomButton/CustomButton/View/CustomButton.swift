//
//  statusButton.swift
//  CCIC
//
//  Created by ACN-LPT279 on 12/5/20.
//  Copyright © 2020 ACN. All rights reserved.
//

import UIKit

class statusButton: UIButton {
    
    
    let type : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    let date : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    let time : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    let icon : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    let  myType:String?
    let  myDate:String?
    let  myTime:String?
    let  myImage:String?
    
    override init(frame: CGRect) {
        self.myType = nil
        self.myDate = nil
        self.myTime = nil
        self.myImage = nil
        super.init(frame:  frame)
    }
    
    init(myType:String, myDate:String, myTime:String?, myImage:String){
        self.myType = myType
        self.myDate = myDate
        self.myTime = myTime
        self.myImage = myImage
        
        super.init(frame: .zero)
        
        addSubviews()
        configure(myType: myType, myDate: myDate, myTime: myTime, myImage: myImage)
        
        
    }
    
    func addSubviews(){
        //        guard !type.isDescendant(of: self) else
        //        {
        //            return
        //        }
        addSubview(type)
        addSubview(date)
        addSubview(time)
        addSubview(icon)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        icon.frame = CGRect(
            x:5,
            y:5,
            width:50,
            height:frame.height
            ).integral
        
        type.frame = CGRect(
            x:60,
            y:5,
            width:frame.width - 65,
            height: (frame.height - 10 ) / 3
            ).integral
        
        date.frame = CGRect(
            x:60,
            y:(frame.height + 10 ) / 3,
            width:frame.width - 65,
            height:(frame.height - 10 ) / 3
            ).integral
        
        time.frame = CGRect(
            x:60,
            y:(frame.height + 10 ) / 3 * 2,
            width:frame.width - 65,
            height:(frame.height - 10 ) / 3
            ).integral
        
    }
    
    public  func configure(myType:String, myDate:String, myTime:String?, myImage:String){
        
        layer.masksToBounds = true
        layer.cornerRadius = 8
        
        type.text = myType
        date.text = myDate
        time.text = myTime
        icon.image = HelpClass.getAccessoryImageView(image: "checkboxBlack", color: UIColor.red).image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

