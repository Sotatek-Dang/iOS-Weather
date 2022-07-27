//
//  UIViewControllerExtension.swift
//  iOS Weather
//
//  Created by Beacon on 27/07/2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    // MARK: Load View Controller from XIB
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        
        return instantiateFromNib()
    }
        
    static func getNavigationViewController() -> UINavigationController {
        let viewController = self.loadFromNib()
        return UINavigationController.init(rootViewController: viewController)
    }
    
    // MARK: -  Show Alert Controller
    func showActionSheet(title: String = "",selectionArray: [String], onTapped: @escaping (String) -> (), onCancel: @escaping () -> ()) {
        DispatchQueue.main.async {
            let actionSheetController: UIAlertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
            for title in selectionArray {
                actionSheetController.addAction(UIAlertAction(title: title, style: UIAlertAction.Style.default, handler: {_ in
                    DispatchQueue.main.async {
                        onTapped(title)
                    }
                }))
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action:UIAlertAction!) in
                DispatchQueue.main.async {
                    onCancel()
                }
            }
            actionSheetController.addAction(cancelAction)
            self.present(actionSheetController, animated: true, completion: nil)
        }
    }
    
    func showAlert(title: String = "", message: String = "", onCancel: @escaping () -> ()) {
        DispatchQueue.main.async {
            let actionSheetController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .destructive) { (action:UIAlertAction!) in
                onCancel()
            }
            actionSheetController.addAction(cancelAction)
            self.present(actionSheetController, animated: true, completion: nil)
        }
    }
}
