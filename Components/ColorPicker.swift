//
//  ColorPicker.swift
//  Serandib
//
//  Created by Malith Wijayathunga on 2024-03-27.
//

import SwiftUI

struct ColorPicker: View {
    
    @Binding var selectedColor: Color
    private let colors:[Color] = [.red, .yellow, .blue, .mint]
    
    var body: some View {
                    HStack {
                        ForEach(colors, id: \.self) { color in
                            Circle()
                                .foregroundColor(color)
                                .frame(width: 20, height: 20)
                                .opacity(color == selectedColor ? 0.5 : 1.0)
                                .scaleEffect(color == selectedColor ? 1.1 : 1.0)
                                .onTapGesture {
                                    selectedColor = color
                                }
                        }
                    }
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(50)
                    .padding(.horizontal)

                }
            
}

#Preview {
    ColorPicker(selectedColor: .constant(.red))
}
