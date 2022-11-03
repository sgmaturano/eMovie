//
//  ResponseVideos.swift
//  TheMovies
//
//  Created by Sergio Maturano on 02/11/2022.
//

import Foundation
import ObjectMapper

class ResponseVideos: NSObject, Mappable {

    var results : [TMVideo]?
    var id : Int?

    class func newInstance(map: Map) -> Mappable?{
        return ResponseVideos()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        id <- map["id"]
        results <- map["results"]
    }

}
