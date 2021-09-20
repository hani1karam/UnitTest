//
//  constat.swift
//  UnitTest
//
//  Created by hany karam on 9/20/21.
//

import Foundation
struct URls {
    lazy var Domain = "https://restaurant.salemsaber.com/api/"
    var allProducts = ""
    init() {
        allProducts = "\(Domain)allProducts"
    }
}
