//
//  Order.swift
//  Product
//
//  Created by RatanakVisal on 28/12/25.
//

import Foundation
import Combine
import SwiftUI

final class Order: ObservableObject{
    @Published var items: [Product] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func addProduct(_ product: Product){
        items.append(product)
    }
    
    func removeProduct(at offeSets: IndexSet){
        items.remove(atOffsets: offeSets)
    }
}
