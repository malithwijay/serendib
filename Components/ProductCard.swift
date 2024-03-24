//
//  ProductCard.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-23.
//

import SwiftUI

struct ProductCard: View {
    
    var productData: ProductListModel
    @EnvironmentObject var cartVM : CartVeiwModel
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image(productData.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(productData.name)
                        .bold()
                    Text("$ \(productData.price)")
                        .font(.caption)
                    
                }.padding()
                 .frame(width: 180, alignment: .leading)
                 .background(.black)
                 .foregroundColor(.white).bold()
                 .opacity(0.8)
                 .cornerRadius(20)
        
            }.frame(width: 180, height: 250)
                .shadow(radius: 3)
            
            Button {
                cartVM.addToCart(productData: productData)
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
    
    ProductCard(productData: productListData[0])
       .environmentObject(CartVeiwModel())
}
