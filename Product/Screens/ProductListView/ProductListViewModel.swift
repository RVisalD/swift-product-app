//
//  ProductListViewModel.swift
//  Product
//
//  Created by RatanakVisal on 26/12/25.
//

import SwiftUI
import Combine

final class ProductListViewModel: ObservableObject{
    @Published var products: [Product] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingProductDetail = false
    
    var selectedProduct: Product? {
        didSet{ isShowingProductDetail = true }
    }
    
    func getProducts (){
        self.isLoading = true
        NetworkManager.shared.getProducts{ result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let products):
                    self.products = products
                case .failure(let error):
                    switch error{
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .invalidUrl:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
