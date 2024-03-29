//
//  ProductCard.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-23.
//

import SwiftUI

struct ProductCard: View {
    
    @EnvironmentObject var cartVM : CartVeiwModel
    var productDM: ProductDataModel
    
    
    var body: some View {
        NavigationLink(destination: ProductDetailsView()) {
            ZStack(alignment: .topTrailing) {
                ZStack(alignment: .bottom) {
                    let imageURL = URL(string: productDM.product_image)!
                    AsyncImage(url: imageURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView() // Placeholder while loading
                                .cornerRadius(10)
                                .cornerRadius(10)
                                .frame(width: 140,height: 200)
                        case .success(let image):
                            image
                                .resizable()
                                .cornerRadius(10)
                                .cornerRadius(10)
                                .frame(width: 140,height: 200)
                        case .failure(let error):
                            Text("Failed to load image")
                                .foregroundColor(.red)
                                .padding()
                                .frame(width: 140,height: 200)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.red, lineWidth: 1)
                                )
                                .onTapGesture {
                                    print("Error loading image: \(error.localizedDescription)")
                                }
                        default:
                            EmptyView()
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text(productDM.product_name)
                            .bold()
                        Text("$ \(productDM.product_price)")
                            .font(.caption)
                        
                    }.padding()
                     .frame(width: 140, alignment: .leading)
                     .background(.black)
                     .foregroundColor(.white).bold()
                     .opacity(0.8)
                     .cornerRadius(20)
            
                }.frame(width: 180, height: 250)
                    .shadow(radius: 3)
                
                Button {
                    //cartVM.addToCart(product: product)
                } label: {
                    Image(systemName: "plus")
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(50)
                        .padding([.leading, .trailing, .bottom, .top] ,10)
                }
                
            }
        }
    }
}

//#Preview {
//    
//    ProductCard(product: productListData[0])
//       .environmentObject(CartVeiwModel())
//}
