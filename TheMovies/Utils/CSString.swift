//
//  CSString.swift
//  TheMovies
//
//  Created by Sergio Maturano on 01/11/2022.
//

import UIKit

extension String {
    
    func isEmail() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }

    func localized(table: String) -> String {
        return NSLocalizedString(self, tableName: table, bundle: Bundle.main, value: "", comment: "")
    }

    func localizedValue(value : CVarArg)  -> String {
        return String.localizedStringWithFormat(NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: ""), value)
    }
    
    func numberInt() -> UInt {
        if let myNumber = NumberFormatter().number(from: self) {
            return myNumber.uintValue
        }
        return 0
    }
    
    func numberString() -> NSNumber {
        if let myNumber = NumberFormatter().number(from: self) {
            return myNumber
        }
        return 0
    }

    func stringByAddingPercentEncodingForURL() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
    }
    
    func randomString(length: Int) -> String {
        let charactersString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        var string = ""
        for _ in 0..<length {
            let random = Int(arc4random_uniform(UInt32(charactersString.count)))
            let index = charactersString.index(charactersString.startIndex, offsetBy: random)
            let charRandom = charactersString[index]
            string.insert(charRandom, at: string.endIndex)
        }
        
        return string
    }

}
