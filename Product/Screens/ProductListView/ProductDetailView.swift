//
//  ProductDetailView.swift
//  Product
//
//  Created by RatanakVisal on 26/12/25.
//

import SwiftUI

struct ProductDetailView: View {
        
    let product: Product
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                ProductRemoteImage(urlString: product.images.first!)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 320, height: 250)

                VStack {
                    Text(product.title)
                        .font(.headline)

                    Text(product.description)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .padding()
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(product.tags, id: \.self) { tag in
                            TagComponent(tag: tag)
                        }
                    }
                }
                .padding()

                HStack {
                    VStack(spacing: 3) {
                        Text("Price")
                            .font(.subheadline)
                            .fontWeight(.bold)

                        Text(String(format: "$%.2f", product.price))
                            .foregroundStyle(.gray)
                    }
                }

                Spacer()

                Button {
                    
                } label: {
                    Text("Place Order")
                        .frame(width: 250, height: 50)
                        .fontWeight(.bold)
                        .background(Color.primaryColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.bottom, 20)
            }
            .frame(width: 320, height: 550)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40) 

            Button {
                isShowing = false
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.black.opacity(0.2))
                    .clipShape(Circle())
            }
            .padding(12)
        }
    }
}

#Preview {
    ProductDetailView(product: MockData.sampleProduct, isShowing: .constant(false))
}
