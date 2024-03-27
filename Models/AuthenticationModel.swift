//
//  AuthenticationModel.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-28.
//

import Foundation

class AuthenticationModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var errorMessage: String?
    
    var onLoginSuccess: (() -> Void)?

    func login(email: String, password: String) {
        guard let url = URL(string: "http://localhost:3000/api/users/login") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        
        
        
        

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let credentials = ["email": email, "password": password]
        do {
            let jsonData = try JSONEncoder().encode(credentials)
            request.httpBody = jsonData
        } catch {
            self.errorMessage = "Error encoding credentials"
            return
        }

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                guard let self = self else { return }

                if let error = error {
                    self.errorMessage = "Login failed: \(error.localizedDescription)"
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    self.errorMessage = "Invalid response"
                    return
                }

                if httpResponse.statusCode == 200 {
                    self.isAuthenticated = true
                    self.errorMessage = nil
                    self.errorMessage = "Login successful!"
                    self.onLoginSuccess?()
                }
                
                
                else {
                    self.errorMessage = "Login failed: Invalid credentials or server error"
                }
            }
        }.resume()
    }
}
