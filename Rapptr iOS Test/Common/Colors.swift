//
//  Colors.swift
//  Rapptr iOS Test
//
//  Created by Polaris on 12/7/21.
//

import Foundation
import UIKit

class Colors: UIColor {
    static let headerBackground = UIColor(hex: 0x0E5C89)
    static let bttonBlue = UIColor(hex: 0x0E5C89)
    static let viewBackground = UIColor(hex: 0xF9F9F9)
    
    static let loginPlaceholder = UIColor(hex: 0x5F6063)
    static let loginFilled = UIColor(hex: 0x1B1E1F)
    
    static let chatUserName = UIColor(hex: 0x1B1E1F)
    static let chatMessage = UIColor(hex: 0x1B1E1F)
    
    static func randomColor() -> UIColor {
        let r = randomCGFloat()
        let g = randomCGFloat()
        let b = randomCGFloat()
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    static func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
