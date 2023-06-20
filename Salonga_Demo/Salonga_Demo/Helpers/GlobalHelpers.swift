//
//  GlobalHelpers.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/20/23.
//

import UIKit

class SizeHelper {
    
    static let NavBarHeight: CGFloat = 44
    
    class func statusBarHeight(from view: UIView) -> CGFloat {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        return window?.safeAreaInsets.top ?? 0
    }
    
    
}
