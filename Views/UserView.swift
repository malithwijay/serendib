//
//  UserView.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-29.
//

import SwiftUI

struct UserView: View {
    @State private var showUpdateFields = false
    @State private var username = "John Doe"
    @State private var email = "john@example.com"
    @State private var address = "123 Main St, City, Country"
    @State private var updatedUsername = ""
    @State private var updatedEmail = ""
    @State private var updatedAddress = ""
    
    var body: some View {
        VStack {
                    Image("user_image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 7)
                        .padding(.bottom, 20)
                    
                    Text(username)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                    
                    Text(email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 5)
                    
                    Text(address)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                    
                    if showUpdateFields {
                        VStack(alignment: .leading) {
                            TextField("Username", text: $updatedUsername)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            TextField("Email", text: $updatedEmail)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            TextField("Address", text: $updatedAddress)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            HStack {
                                Button("Save") {
                                    username = updatedUsername.isEmpty ? username : updatedUsername
                                    email = updatedEmail.isEmpty ? email : updatedEmail
                                    address = updatedAddress.isEmpty ? address : updatedAddress
                                    showUpdateFields.toggle()
                                }
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                                
                                Button("Cancel") {
                                    // Hide update fields and clear updated fields
                                    showUpdateFields.toggle()
                                    updatedUsername = ""
                                    updatedEmail = ""
                                    updatedAddress = ""
                                }
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.gray)
                                .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    if !showUpdateFields {
                        Button("Update Information") {
                            showUpdateFields.toggle()
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                    }
                    
                    Spacer()
                }
                .padding()
                .navigationTitle("Profile")
            }
        }


#Preview {
    UserView()
}
