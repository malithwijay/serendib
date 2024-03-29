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
            Image(product.product_image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
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
        
        
//        HStack {
//            Circle()
//                        .frame(width: 30)
//                        .frame(height: 30)
//                        .cornerRadius(10)
//                        .foregroundColor(getSelection != 0 ? Color.gray : Color.black)
//                        .overlay{
//                            Button(action: {
//                                getSelection = 0
//                                
//                            }, label: {
//                                Text("S")
//                            })
//                            .tint(.white)
//                    }
//            Circle()
//                        .frame(width: 30)
//                        .frame(height: 30)
//                        .cornerRadius(10)
//                        .foregroundColor(getSelection != 1 ? Color.gray : Color.black)
//                        .overlay{
//                            Button(action: {
//                                getSelection = 1
//                            }, label: {
//                                Text("M")
//                            })
//                            .tint(.white)
//                    }
//        }
        
    }
    
}


//#Preview {
//    ProductRow(product: productListData[3])
//        .environmentObject(CartVeiwModel())
//}
