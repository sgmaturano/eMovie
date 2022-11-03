//
//  Date.swift
//  TheMovies
//
//  Created by Sergio Maturano on 01/11/2022.
//

import Foundation

extension Date {
    
    func formatted() -> String {
        let formatter = DateFormatter()
        // 2022-07-03
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        return formatter.string(from: self)
    }

}
