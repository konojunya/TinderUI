//
//  ViewController.swift
//  TinderUI
//
//  Created by konojunya on 2017/07/04.
//  Copyright © 2017年 konojunya. All rights reserved.
//

import UIKit
import SnapKit
import ZLSwipeableViewSwift

class ViewController: UIViewController {
    
    public var numberOfActiveView = UInt(4)
    public var nextView: (() -> UIView?)?
    public var previousView: (() -> UIView?)?
    
    let swipeableView = ZLSwipeableView()
    let images = [
        UIImage(named: "hasikan1"),UIImage(named: "hasikan2"),UIImage(named: "hasikan3"),
        UIImage(named: "hasikan4"),UIImage(named: "hasikan5"),UIImage(named: "hasikan6"),UIImage(named: "hasikan7")
    ]
    var imageIndex = 0
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.swipeableView.nextView = {
            return self.nextCardView()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.swipeableView)
        self.swipeableView.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(300)
            make.centerX.equalTo(self.view.center.x)
            make.top.equalTo(self.view).offset(120)
        }
        self.swipeableView.didStart = {view, location in
            print("Did start swiping view at location: \(location)")
        }
        self.swipeableView.swiping = {view, location, translation in
            print("Swiping at view location: \(location) translation: \(translation)")
        }
        self.swipeableView.didEnd = {view, location in
            print("Did end swiping view at location: \(location)")
        }
        self.swipeableView.didSwipe = {view, direction, vector in
            print("Did swipe view in direction: \(direction), vector: \(vector)")
        }
        self.swipeableView.didCancel = {view in
            print("Did cancel swiping view")
        }
        self.swipeableView.didTap = {view, location in
            print("Did tap at location \(location)")
        }
        self.swipeableView.didDisappear = { view in
            print("Did disappear swiping view")
        }
        
    }

    func nextCardView() -> CardView? {
        if self.imageIndex >= self.images.count {
            self.imageIndex = 0
        }
        
        let cardView = CardView(frame: self.swipeableView.bounds)
        guard let image = self.images[self.imageIndex] else { return cardView }
        cardView.setImage(image: image)
        self.imageIndex += 1
        
        return cardView
        
    }
    
}

