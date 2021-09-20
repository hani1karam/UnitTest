//
//  AllProductResponse.swift
//  UnitTest
//
//  Created by hany karam on 9/20/21.
//

import Foundation
// MARK: - GetProduct
struct GetProduct: Codable {
    let status: Bool
    let error: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id, categoryID: Int?
    let name: String?
    let datumDescription, discount: String?
    let size, extra: [Extra]?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case categoryID = "categoryId"
        case name
        case datumDescription = "description"
        case discount, size, extra, image
    }
}

// MARK: - Extra
struct Extra: Codable {
    let id: Int?
    let name: String?
    let price: String?
}
