//
//  OrderDataModel.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-30.
//

import Foundation

struct OrderDataModel: Codable {
    //var id: Int
    
    var date: String
    var total: Double
    var email: String
}

struct OrderDataRetrieveModel: Codable{
    var id: Int
    var date: String
    var total: Double
    var email: String
}
