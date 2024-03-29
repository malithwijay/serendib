//
//  Products.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-23.
//

import Foundation

struct ProductDataModel: Codable, Identifiable {
    var id: Int
    var product_name: String
    var product_image: String
    var product_details: String
    var product_price: Double
    var product_category: String
    var product_sub_category: String
}
//var productListData = [ProductDataModel(name: "Serendib Suit", image: "dom-hill1", price: 47),
//                       ProductDataModel(name: "Serendib Suit", image: "dom-hill2", price: 47),
//                       ProductDataModel(name: "Serendib Suit", image: "dom-hill2", price: 47),
//                       ProductDataModel(name: "Serendib Suit", image: "dom-hill2", price: 47),
//                       ProductDataModel(name: "Serendib Suit", image: "dom-hill1", price: 47),
//                       ProductDataModel(name: "Serendib Suit", image: "dom-hill1", price: 47),
//                       ProductDataModel(name: "Serendib Suit", image: "dom-hill2", price: 47)]

