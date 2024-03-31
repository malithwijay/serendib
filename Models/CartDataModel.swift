//
//  CartDataModel.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-31.
//

import Foundation

struct CartDataModelInsert : Codable {
    var pid: Int
    var uid: Int
    var color: String
    var size: String
    
}

struct CartDataModelRetrieve : Codable, Identifiable {
    var id : Int
    var product_name: String
    var product_image: String
    var product_details: String
    var product_price: Double
    var color: String
    var size: String
    
}
