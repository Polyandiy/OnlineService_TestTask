//
//  CategoriesSectionView.swift
//  OnlineService_TestTask
//
//  Created by Поляндий on 17.12.2022.
//

import Foundation
import SwiftUI

struct CategoriesSectionView: View {
    
    @Binding var categories: String
    
    var body: some View {
        ZStack {
            Image("image")
                .resizable()
                .cornerRadius(10)
                .frame(width: 180, height: 80)
            Text(categories)
                .lineLimit(2)
                .font(.system(size: 18, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .frame(width: 140)
            
        }.padding(.leading, 2)
    }
}
