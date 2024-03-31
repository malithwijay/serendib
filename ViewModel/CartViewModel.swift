//
//  CartViewModel.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-24.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    
    @Published private(set) var products: [ProductDataModel] = []
    @Published var cartInsertDM = [CartDataModelInsert]()
    @Published var cartRetrieveDM = [CartDataModelRetrieve]()
    @Published private(set) var total: Double = 0
    @Published var showError : Bool = false
    @Published var errorMessage : String = ""
    @Published var showSuccess : Bool = false
    
    init() {
        fetchData()
    }
    
    func addToCart(product: ProductDataModel) {
        products.append(product)
        total += product.product_price
    }
    func removeFromCart(product: ProductDataModel) {
            products = products.filter { $0.id != product.id }
            total -= product.product_price
        }
    
    func fetchData() {
        guard let url = URL(string: "http://localhost:3000/api/cart") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do{
                let decodedResponse = try JSONDecoder().decode([CartDataModelRetrieve].self, from: data)
                    DispatchQueue.main.async {
                        self.cartRetrieveDM = decodedResponse
                    }
                
            } catch {
                
            }
        }.resume()
    }
    
    func addToCart(pid: Int, uid: Int, color: String, size: String) {
        guard let url = URL(string: "http://localhost:3000/api/cart/insert") else {
            print("Invalid URL")
            return
        }
        
        let cartData = CartDataModelInsert(pid: pid, uid: uid, color: color, size: size)
        guard let jsonData = try? JSONEncoder().encode(cartData) else {
            DispatchQueue.main.async {
                self.showError = true
                self.errorMessage = "Failed to encode cart data"
            }
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.showError = true
                    self?.errorMessage = "Network request failed: \(error)"
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)")
                if httpResponse.statusCode == 200 {
                    DispatchQueue.main.async {
                        self?.showSuccess = true
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.showError = true
                        self?.errorMessage = "Server responded with status code: \(httpResponse.statusCode)"
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self?.showError = true
                    self?.errorMessage = "Invalid response from the server"
                }
            }
        }.resume()
    }
    
        
    }




