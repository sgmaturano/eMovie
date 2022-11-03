//
//	TMMovie.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper

class TMMovie: NSObject, Mappable {

	var adult : Bool?
	var backdropPath : String?
	var genreIds : [Int]?
	var id : Int?
    var mediaType : String?
	var originalLanguage : String?
	var originalTitle : String?
	var overview : String?
	var popularity : Float?
	var posterPath : String?
	var releaseDate : String?
	var title : String?
	var video : Bool?
	var voteAverage : Int?
	var voteCount : Int?


	class func newInstance(map: Map) -> Mappable?{
		return TMMovie()
	}
	required init?(map: Map){}
	private override init(){}

    func mapping(map: Map)
    {
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        genreIds <- map["genre_ids"]
        id <- map["id"]
        mediaType <- map["media_type"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        releaseDate <- map["release_date"]
        title <- map["title"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        voteCount <- map["vote_count"]
        
    }

}
