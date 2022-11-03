//
//  TMProgress.swift
//  TheMovies
//
//  Created by Sergio Maturano on 01/11/2022.
//

import UIKit
import MBProgressHUD

class TMProgress : Any {
    
    class func hide(view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }

    class func show(view: UIView) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = "loading".localized
    }
    
    class func show(view: UIView, text: String) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = text.localized
    }
}
