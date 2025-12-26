//
//  TagComponent.swift
//  Product
//
//  Created by RatanakVisal on 26/12/25.
//

import SwiftUI

struct TagComponent: View {
    let tag: String

    var body: some View {
        Text(tag)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .font(.caption)
            .foregroundColor(.green)
            .background(.green.opacity(0.2))
            .cornerRadius(8)
    }
}
