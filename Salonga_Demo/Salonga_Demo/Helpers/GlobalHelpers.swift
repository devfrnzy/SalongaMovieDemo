//
//  GlobalHelpers.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/20/23.
//

import UIKit

class SizeHelper {
    
    static let NavBarHeight: CGFloat = 44
    static let ip6Width: CGFloat = 375
    // Device Handling
    class func statusBarHeight(from view: UIView) -> CGFloat {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        return window?.safeAreaInsets.top ?? 0
    }
    
    class func scale(_ len: CGFloat) -> CGFloat {
        return floor((len) * SizeHelper.scaleRatio)
    }
    
    // Scaling
    static let scaleRatio = UIScreen.main.bounds.size.width/ip6Width
    
    
}
