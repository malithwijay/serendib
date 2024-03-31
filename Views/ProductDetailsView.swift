//
//  ProductView.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-26.
//

import SwiftUI

struct ProductDetailsView: View {
    
    @StateObject var cartVM : CartViewModel = CartViewModel()
    @StateObject var userVM : UserViewModel = UserViewModel()
    
    @State private var selectedSize: String = "Medium"
    @State private var selectedColor: Color = .blue
    @State private var getAction: Bool = false
    
    var productDM : ProductDataModel

    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            HStack{
                let imageURL = URL(string: productDM.product_image)
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView() 
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
                    
                    
                    
                    Text("Rs \(productDM.product_price, specifier: "%.2f")")
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.padding(.top, 20)
                
                
            }
            .padding()
            .navigationTitle("Product Details")
            
            Text(productDM.product_details)
                .font(.title3)
                .padding(.trailing, 5)
                .padding(.leading, 5)
        }
        
        HStack {
           
            VStack {
                Text("Select Color")
                ColorPicker(selectedColor: $selectedColor)
                
            }
            
            VStack {
                //Text("Select Size")
                Picker("Select Size:", selection: $selectedSize) {
                    ForEach(["Small", "Medium", "Large", "XL"], id: \.self) { size in
                        Text(size).tag(size)
                    }
                }.pickerStyle(.inline)
                    .padding(-40)
                    .padding(.top, 35)
                    .clipped()
                                .frame(minWidth: 0, maxWidth: 140)
                                .labelsHidden()
            }
            
        }
        if cartVM.showSuccess {
            Text("Item added to cart!")
                .foregroundStyle(.green)
        }
        
        Button(action:  {
            let colorString = selectedColor.description
            cartVM.addToCart(pid: productDM.id, uid: 3, color: colorString, size: selectedSize)
            
        }) {
            Text("Add to Cart")
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 180, height: 45)
                .background(Color.black)
                .cornerRadius(20)
            
        }
        .padding(.top)

    }
    
}

//#Preview {
//    ProductDetailsView()
//}
