//
//  CartVeiw.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-24.
//

import SwiftUI

struct CartVeiw: View {
    
    @EnvironmentObject var cartVM : CartVeiwModel
    
    var body: some View {
        List{
            if cartVM.products.count > 0 {
                ForEach(cartVM.products, id: \.id) {
                    product in
                    ProductRow(product: product)
                    
                    
                }
                .swipeActions(edge : .trailing, content: {
                    Button(action: {
                        
                    }, label: {
                        Text("Delete")
                    }).tint(.red)
                })
                
                HStack{
                    Text("your cart total is")
                    Spacer()
                    Text("$\(cartVM.total).00").bold()
                }
                .padding()
            }else{
                Text("Your cart is empty!!!")
            }
            
            
        }.navigationTitle(Text("My Cart"))
            .padding(.top)
            
    }
}

#Preview {
    CartVeiw()
        .environmentObject(CartVeiwModel())
}
