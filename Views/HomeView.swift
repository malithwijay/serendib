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

                HStack() {
                    Button("Men") {
                        showMenOptions.toggle()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Button("Women") {
                        showWomenOptions.toggle()
                    }
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
                if showMenOptions {
                                HStack {
                                    TagButton(title: "Shirts")
                                    TagButton(title: "Pants")
                                    TagButton(title: "Shoes")
                                }
                            }
                            
                if showWomenOptions {
                                HStack {
                                    TagButton(title: "Dresses")
                                    TagButton(title: "Skirts")
                                    TagButton(title: "Sandals")
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
        
    }
    
    
    struct TagButton: View {
        var title: String
        
        var body: some View {
            Button(action: {
                // Handle button tap
                print("Selected: \(title)")
            }) {
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
