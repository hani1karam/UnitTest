//
//  StaticShadow.swift
//  UnitTest
//
//  Created by hany karam on 9/20/21.
//

import UIKit
extension UIView{
    func static_shadow(withOffset value:CGSize,color: CGColor){
        self.layer.shadowColor = color
        self.layer.shadowOpacity = 3
        self.layer.shadowOffset = value
        self.layer.shadowRadius = 4
        self.clipsToBounds = false
        self.layer.masksToBounds = false
    }
}
