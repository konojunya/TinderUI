//
//  TinderModel.swift
//  TinderUI
//
//  Created by konojunya on 2017/07/06.
//  Copyright © 2017年 konojunya. All rights reserved.
//

import ObjectMapper

class TinderModel: Mappable {
    
    var images:[String] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func getCount() -> Int {
        return self.images.count
    }
    
    func mapping(map: Map) {
        self.images <- map["files"]
    }
    
}
