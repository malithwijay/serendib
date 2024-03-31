//
//  UserRegisterView.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-31.
//

import SwiftUI

struct UserRegisterView: View {

        @State private var fname = ""
        @State private var lname = ""
        @State private var email = ""
        @State private var address = ""
        @State private var password = ""
        @State private var conpassword = ""
        @State private var shouldNavigateToHome = false
        @EnvironmentObject var cartVM : CartViewModel
        @StateObject var userRegVM : UserRegisterVeiwModel = UserRegisterVeiwModel()
        
        
        
        private var homeViewModel: ProductViewModel {
            ProductViewModel()
        }
        
        var body: some View {
            NavigationView {
                
                VStack(spacing: 16) {
                    Spacer()
                    
                  Image("user")
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 150)
                        .frame(height: 150)
                        .scaledToFit()
                        .padding(.bottom,40)
                    TextField("First Name", text: $fname)
                        .frame(width: 320, height: 50)
                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                    
                    TextField("Last Name", text: $lname)
                        .frame(width: 320, height: 50)
                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                    
                    TextField("Email", text: $email)
                        .frame(width: 320, height: 50)
                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                    
                    TextField("Address", text: $address)
                        .frame(width: 320, height: 50)
                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                    
                    
                    SecureField("Password", text: $password)
                        .frame(width: 320, height: 50)
                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        
                    
                    SecureField("Confirm Password", text: $conpassword)
                        .frame(width: 320, height: 50)
                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        .padding(.bottom,20)
                    
                    
                    
                    Button("Register") {
                        userRegVM.userRegister(fname: fname, lname: lname, address: address, email: email, password: password)
                    }
                    .frame(width: 200)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    
//        if let errorMessage = userRegVM.errorMessage {
//                                    Text(errorMessage)
//                                            .foregroundColor(.red)
//                                    }
                    
//                    NavigationLink(destination: HomeView(), isActive: $shouldNavigateToHome) {
//                        EmptyView()
//                    }
//                    .hidden()
                    
                }
                .padding()
                .onAppear {

                }
                

            }
            
        }
    }


#Preview {
    UserRegisterView()
}
