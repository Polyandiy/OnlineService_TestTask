//
//  CacheImages.swift
//  OnlineService_TestTask
//
//  Created by Поляндий on 17.12.2022.
//

import Foundation
import SwiftUI

protocol CacheProtocol {
    func getImage(cacheKey: String) -> UIImage?
    func addImage(cacheKey: String, image: UIImage)
}

class CacheImages: CacheProtocol {
    
    let imagesCache = NSCache<NSString, UIImage>()
    
    func getImage(cacheKey: String) -> UIImage? {
        return imagesCache.object(forKey: cacheKey as NSString)
    }
    
    func addImage(cacheKey: String, image: UIImage) {
        imagesCache.setObject(image, forKey: cacheKey as NSString)
    }
}

extension CacheImages {
    private static var cache = CacheImages()
    
    class func getImageCache() -> CacheImages {
        return cache
    }
}
