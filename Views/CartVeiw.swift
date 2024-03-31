//
//  CartVeiw.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-24.
//
import Foundation
import SwiftUI

struct CartVeiw: View {
    
    @EnvironmentObject var cartVM : CartViewModel
    @StateObject var userVM : UserViewModel = UserViewModel()
    
    var body: some View {
        List{
            //Text("\(cartVM.cartRetrieveDM.count)")
            if cartVM.cartRetrieveDM.count > 0 {
                ForEach(cartVM.cartRetrieveDM, id: \.id) {
                    product in
                    ProductRow(product: product)
  
                }
                
            }else{
                Text("Your cart is empty!!!")
            }
            
            
        }
        .onAppear{
            cartVM.fetchData(email: userVM.username)
            //cartVM.calculateTotal()
        }
        .onSubmit {
            cartVM.fetchData(email: userVM.username)
            //cartVM.calculateTotal()
        }
        .navigationTitle(Text("My Cart"))
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
