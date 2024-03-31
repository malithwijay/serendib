//
//  OrderViewModel.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-30.
//

import Foundation

class OrderViewModel: ObservableObject {
    
    @Published private(set) var products: [ProductDataModel] = []
    @Published var cartInsertDM = [CartDataModelInsert]()
    @Published var cartRetrieveDM: [CartDataModelRetrieve] = []
    @Published var total: Double = 0.00
    @Published var showError : Bool = false
    @Published var errorMessage : String = ""
    @Published var showSuccess : Bool = false
    @Published var orders: [OrderDataRetrieveModel] = []
    
    func fetchData(email: String) {
        guard let url = URL(string: "http://localhost:3000/api/get-orders/\(email)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do{
                let decodedResponse = try JSONDecoder().decode([OrderDataRetrieveModel].self, from: data)
                    DispatchQueue.main.async {
                        self.orders = decodedResponse
                        //self.calculateTotal()
                    }
                
            } catch {
                
            }
        }.resume()
    }
    
    func OrderPlace(date: String, total: String, email: String) {
        guard let url = URL(string: "http://localhost:3000/api/Orders") else {
            print("Invalid URL")
            return
        }
        var tot = 0.00
        if let doubleValue = Double(total) {
            tot = doubleValue
        }
        let cartData = OrderDataModel(date: date, total: tot, email: email)
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
                        //self?.calculateTotal()
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

