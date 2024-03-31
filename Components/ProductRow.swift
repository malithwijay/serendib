//
//  ProductRow.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-25.
//

import SwiftUI

struct ProductRow: View {
    
    @EnvironmentObject var cartVM : CartViewModel
    var product: CartDataModelRetrieve
    //var cart: CartDataModel
    @State var getSelection = 0
    
    var body: some View {
        HStack(spacing: 20){
            let imageURL = URL(string: product.product_image)!
            AsyncImage(url: imageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView() 
                        .cornerRadius(20)
                        .frame(width: 80, height: 120)
                case .success(let image):
                    image
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 80, height: 120)
                case .failure(let error):
                    Text("Failed to load image")
                        .foregroundColor(.red)
                        .padding()
                        .frame(width: 80, height: 120)
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
                        cartVM.deleteCartItem(ForItemID: "\(product.id)")
                        cartVM.removeFromCart(item: product)
                    } label: {
                        Text("Delete")
                    }.tint(.red)
                })
                

            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.product_name)
                    .bold()
                
                
                Text("Rs \(product.product_price, specifier: "%.2f")")
                
                HStack{
                    Text(product.size)
                    Text(product.color.capitalized)
                }
                
                    
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
