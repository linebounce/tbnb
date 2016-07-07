//
//  StyleSheet.swift
//  tbnb
//
//  Created by Key Hoffman on 7/3/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

/// MARK: - StyleSheet

struct StyleSheet {
    private init() {}
    
    static let DefaultHeadingFontSize:  CGFloat = 20
    static let DefaultSubtitleFontSize: CGFloat = 14
    
    struct MealCard {
        static let HeadingFontSize: CGFloat      = StyleSheet.DefaultHeadingFontSize
        static let PriceSubtitleSize: CGFloat    = 8.0
        static let HostImageBorderWidth: CGFloat = 2.0
        static let Height: CGFloat               = 320.0
    }
    
//    static func prepare(cell: MealTableViewCell) {
//        /// configure cell here!!!!
//    }
}

/// MARK: - BackgroundColor

enum BackgroundColor {
    case White
    case Cyan
    case LightGray
    case Blue
    case Red
    
    var color: UIColor {
        switch self {
        case .White:     return .whiteColor()
        case .Cyan:      return .cyanColor()
        case .LightGray: return .lightGrayColor()
        case .Blue:      return .blueColor()
        case .Red:       return .redColor()
        }
    }
}

/// MARK: - ViewControllerTitle

enum ViewControllerTitle {
    case Opening
    case Login
    case SignUp
    
    var title: String {
        switch self {
        case .Opening: return "Welcome to tbnb"
        case .Login:   return "Login"
        case .SignUp:  return "Sign Up"
        }
    }
}

/// MARK: - ButtonTitle

enum ButtonTitle {
    case Login
    case SignUp
    
    var title: String {
        switch self {
        case .Login:   return "Login"
        case .SignUp:  return "Sign Up"
        }
    }
}

/// MARK: - TextFieldFrame
/// TODO: FIX this!


enum AuthenticationEmailTextFieldFrame {
    case WidthToViewFactor, HeightToViewFactor, TopToViewFactor
    
    var value: CGFloat {
        switch self {
        case .WidthToViewFactor:  return 0.80
        case .HeightToViewFactor: return 0.05
        case .TopToViewFactor:    return 0.20
        }
    }
}



















