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
    @StateObject var orderVM : OrderViewModel = OrderViewModel()
    
    var body: some View {
        List{
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
            
        }
        .onSubmit {
            cartVM.fetchData(email: userVM.username)
            
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
        
        
        HStack{
            Text("your cart total is")
            Spacer()
            Text("Rs \(cartVM.total, specifier: "%.2f")").bold()
        }
        .padding()
        
        
        
        Button(action:{
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            var date =  dateFormatter.string(from: currentDate)
            orderVM.OrderPlace(date: date, total: "\(cartVM.total)", email: userVM.username)
            for data in cartVM.cartRetrieveDM {
                cartVM.deleteCartItem(ForItemID: "\(data.id)")
                cartVM.removeFromCart(item: data)
            }
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
