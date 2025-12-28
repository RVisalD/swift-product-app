//
//  ContentView.swift
//  Product
//
//  Created by RatanakVisal on 25/12/25.
//

import SwiftUI

struct ProductAppTabView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        TabView{
            ProductListView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem{
                    Label("Account", systemImage: "person")
                }
            OrderView()
                .tabItem{
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
        }
    }
}

#Preview {
    ProductAppTabView()
}

