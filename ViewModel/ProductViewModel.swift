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
    
    func fetchData(forCategory category: String) {
        let dataURL = "http://localhost:3000/api/products/\(category)"
        
        guard let url = URL(string: dataURL) else {
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
    
    
    func fetchData(forSubcategory subcategory: String) {
            let dataURL = "http://localhost:3000/api/products/subcategories/\(subcategory)"
            
            guard let url = URL(string: dataURL) else {
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
    
    
    func fetchData(forSubcategory subcategory: String, inCategory category: String) {
            let formattedCategory = category.capitalized
            let formattedSubcategory = subcategory.lowercased()

            let dataURL = "http://localhost:3000/api/products/\(formattedCategory)/\(formattedSubcategory)"

            guard let url = URL(string: dataURL) else {
                print("Invalid URL")
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, error == nil,
                   let decodedResponse = try? JSONDecoder().decode([ProductDataModel].self, from: data) {
                    DispatchQueue.main.async {
                        self.productDM = decodedResponse
                    }
                } else {
                    print("Fetch error: \(error?.localizedDescription ?? "Unknown error")")
                }
            }.resume()
        }
    
}
