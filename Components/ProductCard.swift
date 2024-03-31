//
//  ProductCard.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-23.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartVM: CartViewModel
    var productDM: ProductDataModel
    
    var body: some View {
        NavigationLink(destination: ProductDetailsView(productDM: productDM)) {
            ZStack(alignment: .bottomTrailing) {
                let imageURL = URL(string: productDM.product_image)!
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .cornerRadius(20)
                            .frame(width: 150, height: 210)
                    case .success(let image):
                        image
                            .resizable()
                            .cornerRadius(20)
                            .frame(width: 150, height: 210)
                    case .failure(let error):
                        Text("Failed to load image")
                            .foregroundColor(.red)
                            .padding()
                            .frame(width: 150, height: 210)
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
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(productDM.product_name)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.top, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(10)
                    
                    Text("Rs \(productDM.product_price , specifier: "%.2f")" )
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(10)
                }
                
                Button(action: {
                    cartVM.addToCart(product: productDM)
                        
                    
                }) {
                    Image(systemName: "eye")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .clipShape(Circle())
                        .padding(.trailing, 1)
                        .padding(.bottom, 160)
                        
                }
            }
            .frame(width: 150, height: 210)
            .shadow(radius: 5)
        }
    }
}

// Usage example:
// ProductCard(productDM: productListData[0])
//    .environmentObject(CartVeiwModel())
