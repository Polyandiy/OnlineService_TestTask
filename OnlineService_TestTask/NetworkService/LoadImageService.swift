//
//  LoadImageService.swift
//  OnlineService_TestTask
//
//  Created by Поляндий on 17.12.2022.
//

import Foundation
import SwiftUI

protocol LoadImageProtocol {
    func loadImage()
    func loadImageFromCache() -> Bool
    func loadImageFromURL()
}

class LoadImageService: LoadImageProtocol, ObservableObject {
    
    @Published var image: UIImage = UIImage()
    private var cache = CacheImages.getImageCache()
    private var urlString: String?
    
    init(urlString: String?) {
        self.urlString = urlString
        loadImage()
    }
    
    func loadImage() {
        if loadImageFromCache() {
            return
        }
        loadImageFromURL()
    }
    
    func loadImageFromCache() -> Bool {
        guard let urlString = urlString else { return false }
        guard let cacheImages = cache.getImage(cacheKey: urlString) else { return false }
        
        image = cacheImages
        return true
    }
    
    func loadImageFromURL() {
        guard let urlString = urlString else { return }
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard error == nil, let data = data else { return }
            
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else { return }
                self?.cache.addImage(cacheKey: urlString, image: image)
                self?.image = image
            }
        }
        task.resume()
    }
}
