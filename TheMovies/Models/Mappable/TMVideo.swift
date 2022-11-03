//
//  TMVideo.swift
//  TheMovies
//
//  Created by Sergio Maturano on 02/11/2022.
//

import Foundation
import ObjectMapper

class TMVideo: NSObject, Mappable {
    
    var iso_639_1: String?
    var iso_3166_1: String?
    var name: String?
    var key: String?
    var site: String?
    var size: Int?
    var type: String?
    var official: Bool?
    var published_at: String?
    var id: String?

    class func newInstance(map: Map) -> Mappable?{
        return TMVideo()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        iso_639_1 <- map["iso_639_1"]
        iso_3166_1 <- map["iso_3166_1"]
        name <- map["name"]
        key <- map["key"]
        site <- map["site"]
        size <- map["size"]
        type <- map["type"]
        official <- map["official"]
        published_at <- map["published_at"]
        id <- map["id"]
    }

}
