//
//  CartViewModel.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-24.
//

import Foundation

class CartVeiwModel: ObservableObject {
    
    @Published private(set) var products: [ProductListModel] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(productData: ProductListModel) {
        products.append(productData)
        total += productData.price
        
        func removeFromCart(productData: ProductListModel) {
            products = products.filter { $0.id != productData.id }
            total -= productData.price
        }
        
    }
}
