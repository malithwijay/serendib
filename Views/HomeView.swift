//
//  HomeView.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var cartVM : CartVeiwModel = CartVeiwModel()
    @StateObject var productVM : ProductViewModel = ProductViewModel()
    @State private var showMenOptions = false
    @State private var showWomenOptions = false
    
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
        
        Text("SERENDIB").font(.title).foregroundColor(Color.black).padding(-8)
        
        NavigationView {

            ScrollView {
                
                HStack {
                    Button("Men") {
                        productVM.fetchData(forCategory: "mens")
                        showMenOptions.toggle()
                        showWomenOptions = false
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Button("Women") {
                        productVM.fetchData(forCategory: "womens")
                        showWomenOptions.toggle()
                        showMenOptions = false
                    }
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            
                
                if showMenOptions {
                    HStack {
                        TagButton(title: "Shirts", action: {
                            productVM.fetchData(forSubcategory: "shirts", inCategory: "mens")
                        })
                        TagButton(title: "Polos", action: {
                            productVM.fetchData(forSubcategory: "polos", inCategory: "mens")
                        })
                        TagButton(title: "T-Shirts", action: {
                            productVM.fetchData(forSubcategory: "t-shirts", inCategory: "mens")
                        })
                    }
                }

                if showWomenOptions {
                    HStack {
                        TagButton(title: "tops", action: {
                            productVM.fetchData(forSubcategory: "tops", inCategory: "womens")
                        })
                        TagButton(title: "Bottoms", action: {
                            productVM.fetchData(forSubcategory: "bottoms", inCategory: "womens")
                        })
                        TagButton(title: "Batik", action: {
                            productVM.fetchData(forSubcategory: "batik", inCategory: "womens")
                        })
                    }
                }
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productVM.productDM, id:\.id) { productData in
                        ProductCard(productDM: productData)
                            .environmentObject(cartVM)
                        
                    }.padding()
                    
                    
                    
                }.navigationTitle(Text("Dashboard"))
                   

                    .toolbar {

                        NavigationLink {
                             CartVeiw()
                              .environmentObject(cartVM)
                        } label: {
                            CartButton(numberOfProduct: cartVM.products.count)
                            
                        }
                        
                        NavigationLink {
                             UserView()
                              .environmentObject(cartVM)
                        } label: {
                            Image(systemName: "person.circle")
                            
                        }
                    }
                
                
            }.navigationViewStyle(StackNavigationViewStyle())
            
            
        }
        
        VStack {
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {

                        }) {
                            VStack {
                                Image(systemName: "house.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 24))
                                    .padding()
                                Text("Home")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 14))
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {

                        }) {
                            VStack {
                                Image(systemName: "shippingbox.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size: 24))
                                    .padding()
                                Text("Orders")
                                    .foregroundColor(.red)
                                    .font(.system(size: 14))
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            VStack {
                                Image(systemName: "person.fill")
                                    .foregroundColor(.green)
                                    .font(.system(size: 24))
                                    .padding()
                                Text("Sign  Out")
                                    .foregroundColor(.green)
                                    .font(.system(size: 14))
                            }
                        }
                        
                        Spacer()
                    }

                    .background(Color.white)
                
               }
   
    }
    
    
    struct TagButton: View {
        var title: String
        var action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Text(title)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
    
}
#Preview {
    HomeView()
}
