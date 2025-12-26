//
//  RemoteImage.swift
//  Product
//
//  Created by RatanakVisal on 26/12/25.
//

import SwiftUI
import Combine

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString urlString : String){
        NetworkManager.shared.downloadImage(fromURLString: urlString){ uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async{
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View{
    var image: Image?
    
    var body: some View{
        image?.resizable() ?? Image("product-placeholder").resizable()
    }
}
 
struct ProductRemoteImage: View{
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View{
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.load(fromURLString: urlString)
            }
    }
}
