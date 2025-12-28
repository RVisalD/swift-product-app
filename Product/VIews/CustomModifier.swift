//
//  CustomModifier.swift
//  Product
//
//  Created by RatanakVisal on 28/12/25.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
struct StandardProductImageStyle: ViewModifier {
    func body(content: Content) -> some View{
        content
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
    }
}

extension View{
    func standardButtonStyle() -> some View{
        self.modifier(StandardButtonStyle())
    }
    func standardProductImageStyle() -> some View{
        self.modifier(StandardProductImageStyle())
    }
}
