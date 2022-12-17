//
//  CatalogSectionView.swift
//  OnlineService_TestTask
//
//  Created by Поляндий on 17.12.2022.
//

import Foundation
import SwiftUI

struct CatalogSectionView: View {
    
    let cathalog: CatalogSection
    
    var body: some View {
        HStack {
            ImageFromURL(urlString: cathalog.images.thumbURL, sizeX: 90, sizeY: 90)
            
            VStack(alignment: .leading) {
                Text(cathalog.name)
                    .lineLimit(2)
                    .font(.system(size: 18, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                
                Text(cathalog.street + " " + cathalog.house)
                    .lineLimit(2)
                    .font(.system(size: 14, weight: .medium))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                
                HStack {
                    Text(String(format: "%.1f", cathalog.rating))
                        .lineLimit(1)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.black)
                    
                    ForEach(1...5, id: \.self) { raiting in
                        Image(systemName: "star.fill")
                            .foregroundColor(Int(cathalog.rating) >= raiting ? Color.yellow : Color.gray)
                    }
                }
            }
            
            Spacer()
        }
        .background(Color.white)
    }
}
