//
//  CartVeiw.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-24.
//

import SwiftUI

struct CartVeiw: View {
    
    @EnvironmentObject var cartVM : CartViewModel
    
    var body: some View {
        List{
            if cartVM.products.count > 0 {
                ForEach(cartVM.products, id: \.id) {
                    product in
                    ProductRow(product: product)
  
                }
                
            }else{
                Text("Your cart is empty!!!")
            }
            
            
        }.navigationTitle(Text("My Cart"))
            .padding(.top)
            
        
        HStack{
            Text("your cart total is")
            Spacer()
            Text("$ \(cartVM.total, specifier: "%.2f")").bold()
        }
        .padding()
        
        
        
        Button(action:{
            //loginVM.verifyLogin()
        },label: {
            RoundedRectangle(cornerRadius: 10).frame(height:50)
                .padding(.horizontal,47)
                .padding(.top)
                .foregroundColor(.black)
                }).overlay{
                    Text("Checkout").bold()
                        .foregroundStyle(.white)
                        .padding(.top)
                }
        
    }
    
}

#Preview {
    CartVeiw()
        .environmentObject(CartViewModel())
}
