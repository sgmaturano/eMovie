//
//  Storyboard.swift
//  TheMovies
//
//  Created by Sergio Maturano on 01/11/2022.
//

import UIKit

enum StoryboardName: String {
    case LaunchScreen = "LaunchScreen"
    case Main = "Main"
}

class Storyboard: CSStoryboard {
    
    // MARK: - init
    
    override class func openStoryboard(name: String) -> UIViewController? {
        let vc = super.openStoryboard(name: name)
        return vc
    }
    
    override class func openStoryboard(name: String, indentifier: String) -> UIViewController? {
        let vc = super.openStoryboard(name: name, indentifier: indentifier)
        return vc
    }
    
    class func openStoryboard(name: StoryboardName) -> UIViewController? {
        let vc = CSStoryboard.openStoryboard(name: name.rawValue)
        return vc
    }
    
    class func openStoryboard(name: StoryboardName, indentifier: String) -> UIViewController? {
        let vc = CSStoryboard.openStoryboard(name: name.rawValue, indentifier: indentifier)
        return vc
    }
    
}

class CSStoryboard : Any {
 
    class func openStoryboard(name: String) -> UIViewController? {
        let storyboard = UIStoryboard.init(name: name, bundle: nil)
        return storyboard.instantiateInitialViewController()
    }

    class func openStoryboard(name: String, indentifier: String) -> UIViewController? {
        let storyboard = UIStoryboard.init(name: name, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: indentifier)
    }

}
