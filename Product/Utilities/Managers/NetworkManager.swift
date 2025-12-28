//
//  NetworkManager.swift
//  Product
//
//  Created by RatanakVisal on 25/12/25.
//

import Foundation
import UIKit

final class NetworkManager{
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseUrl = "https://dummyjson.com/"
    private let productEndpoint = baseUrl + "products"
    
    let decoder = JSONDecoder()
    
    private init() {}
    
//    func getProducts(completed: @escaping (Result<[Product], PDError>) -> Void){
//        guard let url = URL(string: productEndpoint) else {
//            completed(.failure(.invalidUrl))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, response, error in  
//            if let _ = error {
//                completed(.failure(.unableToComplete))
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data else {
//                completed(.failure(.invalidData))
//                return
//            }
//            
//            do{
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode(ProductResponse.self, from: data)
//                
//                completed(.success(decodedResponse.products))
//            }
//            catch{
//                completed(.failure(.invalidData))
//            }
//        }
//        task.resume()
//    }
    
    func getProducts() async throws -> [Product] {
        guard let url = URL(string: productEndpoint) else {
            throw PDError.invalidUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do{
            return  try decoder.decode(ProductResponse.self, from: data).products
        } catch{
            throw PDError.invalidData
        }
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        else{
            guard let url = URL(string: urlString) else{
                completed(nil)
                return
            }
            
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
                guard let data = data, let image = UIImage(data: data) else {
                    completed(nil)
                    return
                }
                
                self.cache.setObject(image, forKey: cacheKey)
                
                DispatchQueue.main.async {
                    completed(image) 
                }
            }
            
            task.resume()
        }
    }
}
