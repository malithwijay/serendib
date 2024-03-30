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
    @State var getSelection = 0
    
    var body: some View {
        HStack(spacing: 20){
            let imageURL = URL(string: product.product_image)!
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
                .swipeActions(edge : .trailing, content: {
                    
                    Button {
                        cartVM.removeFromCart(product: product)
                    } label: {
                        Text("Delete")
                    }.tint(.red)
                })
                

            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.product_name)
                    .bold()
                
                
                Text("$\(product.product_price)")
                    
            }
 
        }.padding(.horizontal)
            .frame(maxWidth: .infinity,alignment: .leading)
            .background(.white)
    
    }
    
}


//#Preview {
//    ProductRow(product: productListData[3])
//        .environmentObject(CartVeiwModel())
//}
