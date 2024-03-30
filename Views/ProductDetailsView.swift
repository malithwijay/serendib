//
//  ProductView.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-26.
//

import SwiftUI

struct ProductDetailsView: View {
    
    @StateObject var cartVM : CartVeiwModel = CartVeiwModel()
    @State private var selectedSize: String = "Medium"
    @State private var selectedColor: Color = .blue
    
    var productDM : ProductDataModel
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            HStack{
                let imageURL = URL(string: productDM.product_image)
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView() // Placeholder while loading
                            .cornerRadius(20)
                            .frame(width: 180, height: 250)
                    case .success(let image):
                        image
                            .resizable()
                            .cornerRadius(20)
                            .frame(width: 180, height: 250)
                    case .failure(let error):
                        Text("Failed to load image")
                            .foregroundColor(.red)
                            .padding()
                            .frame(width: 180, height: 250)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.red, lineWidth: 1)
                            )
                            .onTapGesture {
                                print("Error loading image: \(error.localizedDescription)")
                            }
                    default:
                        EmptyView()
                    }
                }
                
                
                
                VStack {
                    Text(productDM.product_name)
                        .font(.title2)
                    
                    
                    
                    Text("$ \(productDM.product_price, specifier: "%.2f")")
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.padding(.top, 20)
                
                
            }
            .padding()
            .navigationTitle("Product Details")
            
            Text(productDM.product_details)
                .font(.title3)
        }
        
        HStack {
           
            VStack {
                Text("Select Color")
                ColorPicker(selectedColor: $selectedColor)
                
                // Text("\(selectedColor.description)")
                //  .font(.system(size: 10, design: .rounded))
            }
            
            VStack {
                //Text("Select Size")
                Picker("Select Size:", selection: $selectedSize) {
                    ForEach(["Small", "Medium", "Large", "XL"], id: \.self) { size in
                        Text(size).tag(size)
                    }
                }.pickerStyle(.inline)
                    .padding(-80)
                    .padding(.top, 35)
                    .clipped()
                                .frame(minWidth: 0, maxWidth: 100)
                                .labelsHidden()
            }
            
        }
        
        
        Button(action:  {
            let colorString = selectedColor.description
            cartVM.addToCart(pid: productDM.id, uid: 1, color: colorString, size: selectedSize)
        }) {
            Text("Add to Cart")
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 180, height: 35)
                .background(Color.black)
                .cornerRadius(10)
            
        }.padding(.top)

    }
    
}

//#Preview {
//    ProductDetailsView()
//}
