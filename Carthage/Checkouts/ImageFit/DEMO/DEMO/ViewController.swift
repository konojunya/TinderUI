//
//  ViewController.swift
//  DEMO
//
//  Created by konojunya on 2017/07/05.
//  Copyright © 2017年 konojunya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = UIImage(named: "pineapple") {
            self.imageView.image = ImageFit.drawInImage(image: image, imageView: self.imageView)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

