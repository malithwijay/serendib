//
//  ProductCard.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-23.
//

import SwiftUI

struct ProductCard: View {
    
    @EnvironmentObject var cartVM : CartVeiwModel
    var product: ProductDataModel
    
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 140)
                    .frame(height: 200)
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .bold()
                    Text("$ \(product.price)")
                        .font(.caption)
                    
                }.padding()
                 .frame(width: 140, alignment: .leading)
                 .background(.black)
                 .foregroundColor(.white).bold()
                 .opacity(0.8)
                 .cornerRadius(20)
        
            }.frame(width: 180, height: 250)
                .shadow(radius: 3)
            
            Button {
                cartVM.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding([.leading, .trailing, .bottom, .top] ,10)
            }
        }
    }
}

#Preview {
    
    ProductCard(product: productListData[0])
       .environmentObject(CartVeiwModel())
}
