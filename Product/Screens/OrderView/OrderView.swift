//
//  OrderView.swift
//  AppetizerApp
//
//  Created by RatanakVisal on 25/12/25.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack{
                    List{
                        ForEach(order.items) { product in
                            ProductCell(product: product)
                        }
                        .onDelete(perform: order.removeProduct)
                    }
                    .listStyle(.plain)
                    HStack {
                        Text("Total")
                            .font(.headline)
                        
                        Spacer()
                        
                        Text("$\(order.totalPrice, specifier: "%.2f")")
                            .font(.headline)
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    Spacer()
                    Button{
                        
                    }label: {
                        Text("Place Order")
                            .padding(.horizontal, 20)
                    }
                    .standardButtonStyle() 
                    .padding(.bottom, 20)
                }
                if !order.items.isEmpty {
                    
                }
                
                if order.items.isEmpty{
                    EmptyState(message: "You have not placed order on any item. \nPlease place some order.")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

#Preview {
    OrderView()
}
