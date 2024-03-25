//
//  CartViewModel.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-24.
//

import Foundation

class CartVeiwModel: ObservableObject {
    
    @Published private(set) var products: [ProductDataModel] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(product: ProductDataModel) {
        products.append(product)
        total += product.price
    }
        func removeFromCart(product: ProductDataModel) {
            products = products.filter { $0.id != product.id }
            total -= product.price
        }
        
    }


