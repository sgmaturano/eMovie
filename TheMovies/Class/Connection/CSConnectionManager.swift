//
//  CSConnectionManager.swift
//  TheMovies
//
//  Created by Sergio Maturano on 01/11/2022.
//

import UIKit
import Alamofire

typealias Response = (Any?, _ success : Bool) -> Void

class CSConnectionManager: Any {
        
    public var baseURL : String
    // static let shared2 = CSConnectionManager()
    
    init() {
        baseURL = ""
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 60
    }
    
    // MARK: - Test
    func testAPI() {
                
        let header: HTTPHeaders = [.authorization(bearerToken: "MbsqACAwsuYD2OcVqjnoCTpDyk13bgvRAY4vjV8KcrB4jOunimaqZgkFQ9n")]
        
        AF.request("https://moonlit-fern-j20zdh213rgz.vapor-farm-e1.com/api/groups", method: .get, headers: header)
            .responseString(completionHandler: { responseString in
                switch responseString.result {
                case .success(let value):
                    print(value)
                case .failure(_):
                    print("")
                }
            })
    }
    
    // MARK: - Methods
    
    func getRequest(endPoint: String, param: [String : Any]?, headers: HTTPHeaders? =  nil, encoding: ParameterEncoding = URLEncoding.default, completion: @escaping Response) {
        self.request(method: .get, endPoint: endPoint, param: param, headers: headers, encoding: encoding, completion: completion)
    }
    
    func postRequest(endPoint: String, param: [String : Any]?, headers: HTTPHeaders? =  nil, encoding: ParameterEncoding = JSONEncoding.default, completion: @escaping Response) {
        self.request(method: .post, endPoint: endPoint, param: param, headers: headers, encoding: encoding, completion: completion)
    }
    
    func putRequest(endPoint: String, param: [String : Any]?, headers: HTTPHeaders? =  nil, encoding: ParameterEncoding = URLEncoding.default, completion: @escaping Response) {
        self.request(method: .put, endPoint: endPoint, param: param, headers: headers, encoding: encoding, completion: completion)
    }

    func deleteRequest(endPoint: String, param: [String : Any]?, headers: HTTPHeaders? =  nil, encoding: ParameterEncoding = URLEncoding.default, completion: @escaping Response) {
        self.request(method: .delete, endPoint: endPoint, param: param, headers: headers, encoding: encoding, completion: completion)
    }
    
    // MARK: - Core
    
    func request(method : HTTPMethod, endPoint: String, param: [String : Any]?, headers: HTTPHeaders?, encoding: ParameterEncoding, completion: @escaping Response) {

        var url = self.baseURL + endPoint
        if endPoint.contains("http"){
            url = endPoint
        }
        
        print("URL:" + url)
        print("HEADERS:" + "\(headers)")
        
        AF.request(url, method: method, parameters: param, encoding: encoding, headers: headers, interceptor: nil)
            .responseString(completionHandler: { responseString in
                switch responseString.result {
                case .success(let value):
                    print(value)
                case .failure(_):
                    print("")
                }
            })
            .responseJSON { (response) in
                
                switch response.result {
                case .success(let value):
                    print(value)
                    if let JSON = value  as? [String: Any] {
                        completion(JSON, true)
                    }else {
                        completion(value, true)
                    }
                    
                case .failure(let error):
                    completion(error, false)
                }
            }
    }
    
}
