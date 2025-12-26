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
            ProductRemoteImage(urlString: product.images.first!) 
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
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
        .frame(width: .infinity)
    }
}

#Preview {
    ProductCell(product: MockData.sampleProduct)
}
