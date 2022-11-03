//
//  Connection+Upcoming.swift
//  TheMovies
//
//  Created by Sergio Maturano on 01/11/2022.
//

import Alamofire
import AlamofireObjectMapper
import ObjectMapper

extension Connection {

    func getListUpcoming(completion: @escaping ASResponseObj) {
        
        let header: HTTPHeaders = [.authorization(bearerToken: Constant.themoviedbToken)]

        self.getRequest(endPoint: EndPoints.Upcoming.rawValue, param: nil, headers: header) { response, success in
            if success {
                if let responseObj = Mapper<ResponseListMovies>().map(JSONObject: response) {
                    completion(responseObj.results, true, nil)
                }else {
                    completion(nil, false, "api.error.get.upcoming")
                }
            }else {
                completion(nil, false, "api.error.connection")
            }
        }
    }

}
