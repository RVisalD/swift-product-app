//
//  ProductCell.swift
//  Product
//
//  Created by RatanakVisal on 25/12/25.
//

import SwiftUI

struct ProductCell: View {
    
    let product: Product
    
    var body: some View {
        HStack (spacing: 5){
            AsyncImage(url: URL(string: product.images.first!)) { image in
                image
                    .resizable()
                    .standardProductImageStyle()
            } placeholder: {
                Image("product-placeholder")
                    .resizable()
                    .standardProductImageStyle()
            }
            VStack (alignment: .leading, spacing: 5){
                Text(product.title)
                    .font(Font.headline)
                    .bold()
                Text("$\(String(format: "%.2f", product.price))")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    ProductCell(product: MockData.sampleProduct)
}
