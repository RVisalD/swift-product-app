//
//  CustomButton.swift
//  Product
//
//  Created by RatanakVisal on 27/12/25.
//

import SwiftUI

struct CustomButton: View {
    var label: String
    var backgroundColor: Color? = nil
    var foregroundColor: Color? = nil
    
    var body: some View {
        Text("Place Order")
            .frame(width: 250, height: 50)
            .fontWeight(.bold)
            .background(backgroundColor ?? Color.primaryColor )
            .foregroundColor( foregroundColor ?? .white)
            .cornerRadius(12)
    }
}

#Preview {
    CustomButton(label: "Place Order")
}
