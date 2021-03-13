//
//  Product.swift
//  koganCodingChallenge
//
//  Created by Anki on 12/03/21.
//

import Foundation

// MARK: - Product
struct Product: Codable {
    var objects: [Object]?
    var next: String?
}

// MARK: - Object
struct Object: Codable {
    var category, title: String?
    var weight: Int?
    var size: Size?
}

// MARK: - Size
struct Size: Codable {
    var width, length, height: Double?
}
