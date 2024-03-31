//
//  LoginView.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-26.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showEmail: String = ""
    @State private var showName: String = ""
    @StateObject var userVM = UserViewModel()
    @ObservedObject var viewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            if userVM.authenticated {
                NavigationStack {
                    ZStack {
                        VStack {
                            Image("user")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 7)
                                .padding(.top, 50)
                            if let user = userVM.user {
                                Text(user.fname)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.bottom, 5)
                                
                                Text(user.email)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 5)
                                
                                Text(user.address)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 20)
                            } else {
                                Text("")
                                    .onAppear {
                                        userVM.fetchUser(email: userVM.email)
                                        
                                    }
                            }
                        }
                    }
                }
                
                VStack(alignment: .center, spacing: 20) {
                    Button {

                        userVM.logout()
                    } label: {
                        HStack {
                            HStack(spacing: 3) {
                               
                                
                                HStack {
                                    
                                    VStack {
                                        Text(userVM.username)
                                            .bold()
                                            .padding()
                                            .foregroundColor(Color.black)
                                        
                                            .bold()
                                            .padding()
                                            .foregroundColor(Color.black)
                                        
                                        Text("Sign out here")
                                            .bold()
                                    }
                                }
                                
                            }
                            .font(.system(size: 16))
                            .tint(.red)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                }
                .opacity(0.8)
                Spacer()
                
                
                
            } else {
                
                Image("user")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .padding(.vertical, 32)
                
                VStack {
                    TextField("Email", text: $email)
                        .frame(width: 320, height: 50)
                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Password", text: $password)
                        .frame(width: 320, height: 50)
                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        .padding(.bottom, 20)
                    
                }
                .padding(.horizontal)
                .padding(.vertical)
                if userVM.showError {
                    Text(userVM.errorMessage)
                        .foregroundStyle(.red)
                        .font(.system(size: 14))
                } else {
                    Text("")
                }
                
                Button(action: {
                    userVM.login(email: email, password: password)
                    
                }, label: {
                    HStack {
                        Text("SIGN IN")
                            .foregroundStyle(.white).bold()
                    }
                    .foregroundColor(.white)
                    .frame(width: 300)
                    .frame(height: 50)
                })
                .background(Color(.black))
                .cornerRadius(20)
                .padding(.top)
                
                NavigationLink(destination: UserRegisterView()) {
                    HStack(spacing: 3) {
                        Text("Not Registered Yet?")
                        Text("Register Now")
                            .bold()
                    }
                    .font(.system(size: 16))
                    .padding(.top)
                }
            }
            
            
        }
    }
}
#Preview {
    LoginView()
}
