//
//  PremiumSectionView.swift
//  OnlineService_TestTask
//
//  Created by Поляндий on 17.12.2022.
//

import Foundation
import SwiftUI

struct PremiumSectionView: View {
    @State private var showAllert: Bool = false
    
    let premium: PremiumSection
    
    var body: some View {
        HStack {
            HStack {
                ImageFromURL(urlString: premium.images.thumbURL, sizeX: 75, sizeY: 75)
                    .padding(.trailing, 8)
                
                VStack(alignment: .leading) {
                    Text(premium.name)
                        .lineLimit(1)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.black)
                    
                    Text(premium.categories?.randomElement() ?? "")
                        .lineLimit(1)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            Button {
                showAllert.toggle()
            } label: {
                Text("Записаться")
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .background(
                        Capsule()
                            .foregroundColor(.pink)
                    )
            }
        }
        .alert(isPresented: $showAllert) { () -> Alert in
            Alert(title: Text(""),
                  message: Text("Требуется регистрация"),
                  dismissButton: .default(Text("Хорошо")))
        }
    }
}
