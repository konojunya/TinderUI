//
//  CardView.swift
//  TinderUI
//
//  Created by konojunya on 2017/07/04.
//  Copyright © 2017年 konojunya. All rights reserved.
//

import UIKit
import AlamofireImage

class CardView: UIView {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(){
        
        self.imageView.backgroundColor = .white
        self.imageView.contentMode = .scaleAspectFill
        
        // shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        self.layer.shadowRadius = 4.0
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        //corner radius
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        
        let contentView = UIView(frame: self.bounds)
        self.addSubview(contentView)
        
        contentView.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { make in
            make.size.equalTo(contentView)
            make.center.equalTo(contentView)
        }
        
    }
    
    func setImage(url: URL) {
        self.imageView.af_setImage(withURL: url)
    }
    
}
