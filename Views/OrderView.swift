//
//  OrderView.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-30.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var cartVM : CartViewModel
    @StateObject var userVM : UserViewModel = UserViewModel()
    @StateObject var orderVM : OrderViewModel = OrderViewModel()
    
    var body: some View {
        List{
            if orderVM.orders.count > 0 {
                ForEach(orderVM.orders, id: \.id) {
                    product in
                    Section("Order No. \(product.id)"){
                        Text("Order Date: \(product.date)")
                        Text("Total: \(product.total,specifier: "%.2f")")
                    }
                }
                
            }else{
                Text("No pending orders !")
            }
            
            
        }
        .onAppear{
            orderVM.fetchData(email: userVM.username)
            
        }
        .onSubmit {
            cartVM.fetchData(email: userVM.username)
            
        }
        .navigationTitle(Text("My Orders"))
        .padding(.top)
        
        
    }
    
}



#Preview {
    
    OrderView()
        .environmentObject(CartViewModel())
}
