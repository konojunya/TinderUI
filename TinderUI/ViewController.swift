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
        UIImage(named: "img1"),UIImage(named: "img2"),UIImage(named: "img3"),UIImage(named: "img4"),
        UIImage(named: "img5"),UIImage(named: "img6"),UIImage(named: "img7"),UIImage(named: "img8"),
        UIImage(named: "img9"),UIImage(named: "img10"),UIImage(named: "img11")
    ]
    
    var imageIndex = 0
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.swipeableView.nextView = {
            return self.nextCardView()
        }
        self.swipeableView.previousView = {
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
            make.width.equalTo(self.view.bounds.width - 50)
            make.height.equalTo(self.view.bounds.width - 50)
            make.center.equalTo(self.view.center)
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
        
        let undo = UIButton(frame: CGRect(x: self.view.center.x - 25, y: self.view.frame.height - 100, width: 50, height: 50))
        undo.setImage(UIImage(named: "undo"), for: .normal)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.undoTap(_:)))
        undo.addGestureRecognizer(tapGesture)
        
        self.view.addSubview(undo)
        
    }
    
    func undoTap(_ sender: UITapGestureRecognizer){
        self.swipeableView.rewind()
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

