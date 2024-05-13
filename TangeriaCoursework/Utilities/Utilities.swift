//
//  Utilities.swift
//  TangeriaCoursework
//
//  Created by Oliver Otchere on 11/05/2024.
//

import Foundation
import UIKit

final class Utilities{
    static let shared = Utilities()
    
    private init(){}
    
    func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController?{
        if let navigationController = controller as? UINavigationController{
            return topViewController(controller: navigationController)
        }
        
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        
        return controller
    }
}
