//
//  ContentView.swift
//  Product
//
//  Created by RatanakVisal on 25/12/25.
//

import SwiftUI

struct ProductAppTabView: View {
    var body: some View {
        TabView{
            ProductListView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem{
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .accentColor(.primaryColor)
    }
}

#Preview {
    ProductAppTabView()
}
