//
//  ProductListViewModel.swift
//  Product
//
//  Created by RatanakVisal on 26/12/25.
//

import SwiftUI
import Combine

@MainActor final class ProductListViewModel: ObservableObject{
    @Published var products: [Product] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingProductDetail = false
    
    var selectedProduct: Product? {
        didSet{ isShowingProductDetail = true }
    }
    
//    func getProducts (){
//        self.isLoading = true
//        NetworkManager.shared.getProducts{ result in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                switch result {
//                case .success(let products):
//                    self.products = products
//                case .failure(let error):
//                    switch error{
//                    case .invalidData:
//                        self.alertItem = AlertContext.invalidData
//                        
//                    case .invalidResponse:
//                        self.alertItem = AlertContext.invalidResponse
//                        
//                    case .invalidUrl:
//                        self.alertItem = AlertContext.invalidURL
//                        
//                    case .unableToComplete:
//                        self.alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    func getProducts () {
        self.isLoading = true
        Task{
            do{
                products = try await NetworkManager.shared.getProducts()
                self.isLoading = false
            } catch{
                self.isLoading = false
                if let pdError = error as? PDError {
                    switch pdError {
                    case .invalidUrl:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
                else{
                    alertItem = AlertContext.invalidData
                } 
            }
        }
    }
}
