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
    
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
 
        Text("SERENDIB").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(Color.black).padding(-8)

             
        ScrollView(.horizontal) {
            HStack {
                Button("men") {
                
                }
                .frame(width: 100)
                .padding(10)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
                .opacity(0.7)
                
                
                Button("women") {
                   // viewModel.login(email: email, password: password)
                }
                .frame(width: 100)
                .padding(10)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
                .opacity(10)
                
                Button("kids") {
                   // viewModel.login(email: email, password: password)
                }
                .frame(width: 100)
                .padding(10)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
                .opacity(10)
            }.padding([.leading, .top])
        }
        
                NavigationView {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(productVM.product, id:\.id) { productData in
                                ProductCard(product: productData)
                                    .environmentObject(cartVM)
                                
                            }
                        
                        }.padding()
                        
                        
                        
                    }.navigationTitle(Text("Mens"))
                    
                    
                .toolbar {

//                    NavigationLink {
//                        ProductDetailsView()
//                        
//                    } label: {
//                        Image(systemName:"bell").foregroundColor(.black)
//
//                    }
                    NavigationLink {
                        CartVeiw()
                            .environmentObject(cartVM)
                    } label: {
                        CartButton(numberOfProduct: cartVM.products.count)
                    
                    }
                    
                    
                }
            
        }.navigationViewStyle(StackNavigationViewStyle())
        
        
        
}
}

#Preview {
    HomeView()
}
