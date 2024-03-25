//
//  Products.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-23.
//

import Foundation

struct ProductListModel: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productListData = [ProductListModel(name: "Serendib Suit", image: "dom-hill1", price: 47),
                       ProductListModel(name: "Serendib Suit", image: "dom-hill2", price: 47),
                       ProductListModel(name: "Serendib Suit", image: "dom-hill2", price: 47),
                       ProductListModel(name: "Serendib Suit", image: "dom-hill2", price: 47),
                       ProductListModel(name: "Serendib Suit", image: "dom-hill1", price: 47),
                       ProductListModel(name: "Serendib Suit", image: "dom-hill1", price: 47),
                       ProductListModel(name: "Serendib Suit", image: "dom-hill2", price: 47)]

