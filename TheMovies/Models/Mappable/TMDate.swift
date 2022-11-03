//
//	TMDate.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper

class TMDate: NSObject, Mappable {

	var maximum : String?
	var minimum : String?

	class func newInstance(map: Map) -> Mappable?{
		return TMDate()
	}
	required init?(map: Map){}
	private override init(){}

    func mapping(map: Map)
    {
        maximum <- map["maximum"]
        minimum <- map["minimum"]
    }
}
