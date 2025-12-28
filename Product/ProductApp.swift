//
//  ProductApp.swift
//  Product
//
//  Created by RatanakVisal on 25/12/25.
//

import SwiftUI

@main
struct ProductApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            ProductAppTabView().environmentObject(order)
        }
    }
}
