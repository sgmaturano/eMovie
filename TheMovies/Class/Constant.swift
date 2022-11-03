//
//  Constant.swift
//  TheMovies
//
//  Created by Sergio Maturano on 01/11/2022.
//

import UIKit

class Constant : Any {
    
    static let baseURL = "https://api.themoviedb.org/3/"
    static let themoviedbToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZDdhZWZmNTBiNzU5OWZmMDFkYjVkZDQzOTBiOGQyZiIsInN1YiI6IjYzNjE3NzdkZDc1YmQ2MDA3ZTcxMTI1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BYY0QH3IPwe6g0AVw0C_QWhz7Df-C3qLdK-TV2Cvudk"

    static let baseImageURL = "https://image.tmdb.org/t/p/w500"
    static let baseVideoURL = "https://www.youtube.com/watch?v="

    static let timeSplashTransitionDelay = 2.0
    static let numberItemsRecommed = 6

    static let sizeMoviewImage = CGSize(width: 200.0, height: 250.0)

}
