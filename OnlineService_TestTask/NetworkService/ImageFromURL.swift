//
//  ImageFromURL.swift
//  OnlineService_TestTask
//
//  Created by Поляндий on 17.12.2022.
//

import Foundation
import SwiftUI

struct ImageFromURL: View {
    
    @ObservedObject var loadImageService: LoadImageService
    
    var sizeX: CGFloat?
    var sizeY: CGFloat?
    
    init(urlString: String?, sizeX: CGFloat, sizeY: CGFloat) {
        loadImageService = LoadImageService(urlString: urlString)
        self.sizeX = sizeX
        self.sizeY = sizeY
    }
    
    init(urlString: String?) {
        loadImageService = LoadImageService(urlString: urlString)
        sizeX = UIScreen.main.bounds.width
    }
    
    var body: some View {
        if loadImageService.image != nil {
            Image(uiImage: loadImageService.image)
                .resizable()
                .scaledToFit()
                .frame(width: sizeX != nil ? sizeX : .none, height: sizeY != nil ? sizeY : .none)
        } else {
            preloadingImage
        }
    }
    
    private var preloadingImage: some View {
        RoundedRectangle(cornerRadius: 5)
            .foregroundColor(.gray)
            .frame(width: sizeX != nil ? sizeX : .none, height: sizeY != nil ? sizeY : .none)
    }
}
