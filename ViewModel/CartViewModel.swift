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
    @Published var cartRetrieveDM: [CartDataModelRetrieve] = []
    @Published var total: Double = 0.00
    @Published var showError : Bool = false
    @Published var errorMessage : String = ""
    @Published var showSuccess : Bool = false
    @Published var items: [CartDataModelRetrieve] = []
    
    
    func addToCart(product: ProductDataModel) {
        products.append(product)
        //total += product.product_price
    }
//    func removeFromCart(product: CartDataModelRetrieve) {
//            products = products.filter { $0.id != product.id }
//            total -= product.product_price
//    }
    
    func removeFromCart(item : CartDataModelRetrieve){
        cartRetrieveDM = cartRetrieveDM.filter { $0.id != item.id }
        calculateTotal()
    }
    
    func calculateTotal() {
        var totalAmount: Double = 0.0
        for item in cartRetrieveDM {
            totalAmount += item.product_price
        }
        self.total = totalAmount
    }
    
    enum SortState {
            case none, priceLowToHigh, priceHighToLow
        }


        @Published var sortState: SortState = .none

    func sortProducts() {
        switch sortState {
        case .priceLowToHigh:
            products.sort(by: { $0.product_price < $1.product_price })
        case .priceHighToLow:
            products.sort(by: { $0.product_price > $1.product_price })
        case .none:
            break
        }
    }
       
    
    func deleteCartItem(ForItemID id: String) {
        guard let url = URL(string: "http://localhost:3000/api/cart/delete/\(id)") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let _ = data, error == nil else {
                self.errorMessage = error?.localizedDescription ?? "Unknown error"
                return
            }
            
            
            
            DispatchQueue.main.async {
                // Handle successful deletion if needed
            }
        }.resume()
        //self.calculateTotal()
    }
    
    func fetchData(email: String) {
        guard let url = URL(string: "http://localhost:3000/api/cart/items/\(email)") else {
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
                        self.calculateTotal()
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
                        self?.calculateTotal()
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




