//
//  ProductView.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-26.
//

import SwiftUI

struct ProductView: View {
    
    @State private var selectedSize: String = "Medium"
    
    var body: some View {
        
        ScrollView{
            HStack{
                Image("dom-hill1")
                    .resizable()
                    .frame(width: 200, height: 210)
                    .cornerRadius(12)
                   
                    .padding(.trailing, 10)
                    
                
                VStack {
                    Text("Jump Suit")
                        .font(.title2)
                    
                    Text("$47")
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
                
            }
            .padding()
            .navigationTitle("Product Details")
        }
        
        Text("Select Size")
        
        Picker("Select Size:", selection: $selectedSize) {
            ForEach(["Small", "Medium", "Large", "XL", "XXL"], id: \.self) { size in
                Text(size).tag(size)
            }
        }.pickerStyle(.inline)
        
        
        Button(action: {
            
        }) {
            Text("Add to Cart")
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(Color.black)
                .cornerRadius(10)
            
        }.padding()
    }
    
}

#Preview {
    ProductView()
}
