//
//  AppetizerListView.swift
//  AppetizerApp
//
//  Created by RatanakVisal on 25/12/25.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var viewModel = ProductListViewModel()
    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.products){
                    product in
                    ProductCell(product: product)
                        .onTapGesture{
                            viewModel.selectedProduct = product
                        }
                }
                .navigationTitle("🧢 Products")
                .disabled(viewModel.isShowingProductDetail)
            }
            .onAppear{
                viewModel.getProducts()
            }
            .blur(radius: viewModel.isShowingProductDetail ? 20 : 0)
            if viewModel.isShowingProductDetail {
                ProductDetailView(
                    product: viewModel.selectedProduct ?? MockData.sampleProduct,
                    isShowing: $viewModel.isShowingProductDetail
                )
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton
            )
        }
    }
}

#Preview {
    ProductListView()
}

