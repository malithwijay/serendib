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
        ScrollView{
            Text("Your cart is empty")
            
        }.navigationTitle(Text("My Cart"))
            .padding(.top)
    }
}

#Preview {
    CartVeiw()
        .environmentObject(CartVeiwModel())
}
