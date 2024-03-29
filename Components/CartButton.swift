//
//  CartButton.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-24.
//

import SwiftUI

struct CartButton: View {
    var numberOfProduct: Int
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "bag")
                .padding(.top,-2)
                .foregroundColor(.black)
            
            if numberOfProduct > 0 {
                Text("\(numberOfProduct)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                    .cornerRadius(50)
                    .padding(-8)
            }
        }.padding(10)
    }
}

#Preview {
    CartButton(numberOfProduct: 1)
}
