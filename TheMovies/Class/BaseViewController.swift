//
//  BaseViewController.swift
//  TheMovies
//
//  Created by Sergio Maturano on 01/11/2022.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    static var currentWindows: UIWindow? {
        return UIApplication.shared.windows.first
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.loadText()
        self.configUI()
    }
    
    func setup(){

        let nav = self.navigationController?.navigationBar
        // nav?.barTintColor = UIColor.white
        nav?.tintColor = UIColor.white

        nav?.backIndicatorImage = UIImage(named: "ic_back")
        nav?.backIndicatorTransitionMaskImage = UIImage(named: "ic_back")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func loadText(){

    }
    
    func configUI(){
        
    }
    
    class func getVisibleViewController(_ rootViewController: UIViewController?) -> UIViewController? {

        var controller = rootViewController
        if controller == nil {
            controller = UIApplication.shared.windows.last?.rootViewController
        }

        if let navigationController = controller as? UINavigationController {
            return getVisibleViewController(navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return getVisibleViewController(selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return getVisibleViewController(presented)
        }
        return controller
    }
    
    // MARK: -
    func showError(error : String?, handler: ((UIAlertAction) -> Void)? = nil) {
        
        let alert = UIAlertController(title: "alert.warning".localized, message: error?.localized, preferredStyle: .alert)
        
        let okOp = UIAlertAction(title: "alert.accept".localized, style: .default, handler: handler)
        
        alert.addAction(okOp)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(error : String?) {
        
        let alert = UIAlertController(title: "alert.warning".localized, message: error?.localized, preferredStyle: .alert)
        
        let okOp = UIAlertAction(title: "alert.accept".localized, style: .default, handler:{ (alert: UIAlertAction!) -> Void in
        })
        alert.addAction(okOp)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showSuccess(msg : String?, title: String = "alert.title.app") {
        
        let alert = UIAlertController(title: title.localized, message: msg?.localized, preferredStyle: .alert)
        
        let okOp = UIAlertAction(title: "alert.accept".localized, style: .default, handler:{ (alert: UIAlertAction!) -> Void in
        })
        alert.addAction(okOp)
        
        self.present(alert, animated: true, completion: nil)
    }

    func showAlertConfirm(msg : String?, title: String = "alert.title.app", handler: ((UIAlertAction) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title.localized, message: msg?.localized, preferredStyle: .alert)
        
        let okOp = UIAlertAction(title: "alert.accept".localized, style: .destructive, handler: handler)
        alert.addAction(okOp)

        let cancelOp = UIAlertAction(title: "alert.cancel".localized, style: .cancel, handler:{ (alert: UIAlertAction!) -> Void in
        })
        alert.addAction(cancelOp)

        
        self.present(alert, animated: true, completion: nil)
    }

    // MARK: -
    @IBAction func goBack() {
        self.navigationController?.popViewController(animated: true)
    }

}
