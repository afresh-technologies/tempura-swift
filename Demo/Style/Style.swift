//
//  Style.swift
//  KatanaExperiment
//
//  Created by Andrea De Angelis on 14/07/2017.
//
//

import Foundation
import UIKit
import Chocolate

enum AppPalette {
  static var white = UIColor(rgbHex: "#ECEEEB")
  static var yellowish = UIColor(rgbHex: "#D8C9A7")
  static var dirtWhite = UIColor(rgbHex: "#D2CFC7")
}

enum AppFont {
  static var h1: UIFont = AppFont.AvenirNext.bold(size: 36.0)
  static var h2: UIFont = AppFont.AvenirNext.bold(size: 20.0)
  static var h3: UIFont = AppFont.AvenirNext.regular(size: 16.0)
  static var body: UIFont = UIFont.systemFont(ofSize: 16.0)
}

// Avenir Next
extension AppFont {
  enum AvenirNext {
    static func bold(size: CGFloat) -> UIFont {
      print(UIFont(name: "AvenirNext-Bold", size: size)!)
      return UIFont(name: "AvenirNext-Bold", size: size)!
    }
    
    static func medium(size: CGFloat) -> UIFont {
      return UIFont(name: "AvenirNext-Medium", size: size)!
    }
    
    static func regular(size: CGFloat) -> UIFont {
      return UIFont(name: "AvenirNext-Regular", size: size)!
    }
  }
  
  static func system(size: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size)
  }
}

extension UIFont {
  var boldVersion: UIFont {
    return UIFont(name: "AvenirNext-Bold", size: self.pointSize)!
  }
  
  var regularVersion: UIFont {
    return UIFont(name: "AvenirNext-Regular", size: self.pointSize)!
  }
  
  var mediumVersion: UIFont {
    return UIFont(name: "AvenirNext-Medium", size: self.pointSize)!
  }
}

extension UIColor {
  convenience init(rgbHex: String) {
    try! self.init(hex: rgbHex)
  }
}