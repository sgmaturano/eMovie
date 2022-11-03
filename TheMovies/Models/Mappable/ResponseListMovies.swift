//
//	ResponseListMovies.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper

class ResponseListMovies: NSObject, Mappable {

	var dates : TMDate?
	var page : Int?
	var results : [TMMovie]?
	var totalPages : Int?
	var totalResults : Int?

	class func newInstance(map: Map) -> Mappable?{
		return ResponseListMovies()
	}
	required init?(map: Map){}
	private override init(){}
    
    func mapping(map: Map)
    {
        dates <- map["dates"]
        page <- map["page"]
        results <- map["results"]
        totalPages <- map["total_pages"]
        totalResults <- map["total_results"]
    }

}
