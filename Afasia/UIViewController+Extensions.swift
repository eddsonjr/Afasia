//
//  UIViewController+Extensions.swift
//  Afasia
//
//  Created by Edson  Jr on 23/01/18.
//  Copyright © 2018 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func instantiateFromStoryboard(_ name: String = "Main") -> Self
    {
        return instantiateFromStoryboardHelper(name)
    }
    
    fileprivate class func instantiateFromStoryboardHelper<T>(_ name: String) -> T
    {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! T
        return controller
    }
    
    
    //Usage:
    //let controller = MyViewController.instantiateFromStoryboard()
    
}
