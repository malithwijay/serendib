//
//  ProductRow.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-25.
//

import SwiftUI

struct ProductRow: View {
    
    @EnvironmentObject var cartVM : CartVeiwModel
    var product: ProductDataModel
    
    var body: some View {
        HStack(spacing: 20){
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .bold()
                
                Text("$\(product.price)")
                    
            }
            
            Spacer()
            
            
            
            
        }.padding(.horizontal)
            .frame(maxWidth: .infinity,alignment: .leading)
        
    }
}


#Preview {
    ProductRow(product: productListData[3])
        .environmentObject(CartVeiwModel())
}
