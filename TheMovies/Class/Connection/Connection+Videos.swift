//
//  Connection+Videos.swift
//  TheMovies
//
//  Created by Sergio Maturano on 02/11/2022.
//

import Alamofire
import AlamofireObjectMapper
import ObjectMapper

extension Connection {

    func getVideos(id: String, completion: @escaping ASResponseObj) {
        
        let endPoint = EndPoints.Videos.rawValue.replacingOccurrences(of: "%@", with: id)
        let header: HTTPHeaders = [.authorization(bearerToken: Constant.themoviedbToken)]

        self.getRequest(endPoint: endPoint, param: nil, headers: header) { response, success in
            if success {
                if let responseObj = Mapper<ResponseVideos>().map(JSONObject: response) {
                    completion(responseObj.results, true, nil)
                }else {
                    completion(nil, false, "api.error.get.video")
                }
            }else {
                completion(nil, false, "api.error.connection")
            }
        }
    }

}
