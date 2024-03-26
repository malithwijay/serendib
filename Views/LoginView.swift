//
//  LoginView.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-26.
//

import SwiftUI

struct LoginView: View {
    
    //@StateObject private var viewModel = AuthenticationViewModel()
    @State private var email = ""
    @State private var password = ""
    @State private var shouldNavigateToHome = false
    @EnvironmentObject var cartVM : CartVeiwModel
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 16) {
                Spacer()
                
                Image("loginSplash")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 500)
                    .frame(height: 500)
                    .scaledToFit()
                
                TextField("Email", text: $email)
                    .frame(width: 320, height: 50)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    
                
                SecureField("Password", text: $password)
                    .frame(width: 320, height: 50)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.bottom,20)
                
                
                
                Button("Login") {
                   // viewModel.login(email: email, password: password)
                }
                .frame(width: 200)
                .padding(10)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                
//                if let errorMessage = viewModel.errorMessage {
//                    Text(errorMessage)
//                        .foregroundColor(.red)
//                }
//                NavigationLink(destination: ), isActive: $shouldNavigateToHome) {
//                    EmptyView()
//                }
//                .hidden()
                
            }
            .padding()
            .onAppear {
               
            }
            
            
            
            
        }
    }
}


#Preview {
    LoginView()
}
