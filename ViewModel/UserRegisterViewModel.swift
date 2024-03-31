//
//  UserRegisterViewModel.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-31.
//

import Foundation
import SwiftUI

class UserRegisterVeiwModel: ObservableObject {
    
    
    @Published var userRegDM = [UserRegisterDataModel]()
    @Published var showError : Bool = false
    @Published var errorMessage : String = ""
    @Published var showSuccess : Bool = false
    
    func userRegister(fname: String, lname: String, address: String, email: String, password: String) {
        guard let url = URL(string: "http://localhost:3000/api/users/register") else {
            print("Invalid URL")
            return
        }
        
        let userRegData = UserRegisterDataModel(fname: fname, lname: lname, address: address, email: email, password: password)
        guard let jsonData = try? JSONEncoder().encode(userRegData) else {
            DispatchQueue.main.async {
                self.showError = true
                self.errorMessage = "Failed to encode user data"
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

