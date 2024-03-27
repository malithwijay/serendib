//
//  ProductView.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-26.
//

import SwiftUI

struct ProductDetailsView: View {
    
    @State private var selectedSize: String = "Medium"
    @State private var selectedColor: Color = .blue
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            HStack{
                Image("dom-hill1")
                    .resizable()
                    .frame(width: 150, height: 240)
                    .cornerRadius(12)
                
                
                VStack {
                    Text("Jump Suit")
                        .font(.title2)
                    
                    
                    
                    Text("$47")
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.padding(.top, 20)
                
                
            }
            .padding()
            .navigationTitle("Product Details")
            
            Text("Description")
                .font(.title3)
        }
        
        Text("Select Color")
        VStack {
            ColorPicker(selectedColor: $selectedColor)

           // Text("\(selectedColor.description)")
              //  .font(.system(size: 10, design: .rounded))
        }
    
        
        Text("Select Size")
        Picker("Select Size:", selection: $selectedSize) {
            ForEach(["Small", "Medium", "Large", "XL"], id: \.self) { size in
                Text(size).tag(size)
            }
        }.pickerStyle(.inline)
         .padding(-40)
        
        
        
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
    ProductDetailsView()
}
