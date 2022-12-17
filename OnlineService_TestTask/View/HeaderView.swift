//
//  HeaderView.swift
//  OnlineService_TestTask
//
//  Created by Поляндий on 17.12.2022.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    
    @StateObject var mainViewModel = MainViewModel()
    
    var body: some View {
        GeometryReader { reader -> AnyView in
            let offset = reader.frame(in: .global).minY
            if -offset >= 0 {
                DispatchQueue.main.async {
                    self.mainViewModel.offset = -offset
                }
            }
            
            return AnyView (
                ZStack {
                    Image("Пара на диване")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 250 + (offset > 0 ? offset : 0))
                        .cornerRadius(2)
                        .brightness(-0.1)
                        .blur(radius: 0.2)
                        .offset(y: (offset > 0 ? -offset : 0))
                    Text("Онлайн - запись и бронирование услуг")
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .font(.system(size: 22, weight: .bold))
                        .multilineTextAlignment(.center)
                }
            )
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
