//
//  TinderAPI.swift
//  TinderUI
//
//  Created by konojunya on 2017/07/06.
//  Copyright © 2017年 konojunya. All rights reserved.
//

import APIKit
import ObjectMapper

protocol TinderRequest: Request {
    
}

extension TinderRequest {
    
    var baseURL: URL {
        return URL(string: "http://tmp.fun:2000")!
    }
    
}

struct FetchTinderRequest: TinderRequest {
    
    typealias Response = TinderModel
    
    var path: String {
        return "/"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> FetchTinderRequest.Response {
        return Mapper<TinderModel>().map(JSONObject: object)!
    }
    
}
