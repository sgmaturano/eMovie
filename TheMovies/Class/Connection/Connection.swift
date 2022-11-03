//
//  Connection.swift
//  TheMovies
//
//  Created by Sergio Maturano on 23/08/2022.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

enum EndPoints: String {
    case Upcoming = "/movie/upcoming"
    case TopRated = "/movie/top_rated"
    case Trending = "/trending/movie/week"
    case Videos = "/movie/%@/videos"

}

typealias ASResponse = (_ success : Bool,_ error: String?) -> Void
typealias ASResponseObj = (_ obj: Any?, _ success : Bool,_ error: String?) -> Void

class Connection: CSConnectionManager {
        
    static let shared = Connection()
    
    override init() {
        super.init()
        self.baseURL = Constant.baseURL
    }
}
