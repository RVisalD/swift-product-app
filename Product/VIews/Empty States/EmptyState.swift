//
//  EmptyState.swift
//  Product
//
//  Created by RatanakVisal on 28/12/25.
//

import SwiftUI

struct EmptyState: View {
    var imageName: String?
    var message: String?
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack{
                Image(imageName ?? "empty-order")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text(message ?? "No Product has been added")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    EmptyState()
}
