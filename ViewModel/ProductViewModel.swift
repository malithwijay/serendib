//
//  ItemViewModel.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-23.
//

import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    
    @Published var productDM = [ProductDataModel]()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "http://localhost:3000/api/products") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([ProductDataModel].self, from: data) {
                DispatchQueue.main.async {
                    self.productDM = decodedResponse
                }
            }
        }.resume()
    }
}
