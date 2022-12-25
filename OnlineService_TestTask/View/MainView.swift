//
//  MainView.swift
//  OnlineService_TestTask
//
//  Created by Поляндий on 17.12.2022.
//

import Foundation
import SwiftUI

struct MainView: View {
    @State private var showAllert: Bool = false
    
    @StateObject var mainViewModel = MainViewModel()
    
    var items = [GridItem(.fixed(60)), GridItem(.fixed(60))]
    
    var body: some View {
        ScrollView{
            LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders], content: {
                HeaderView()
                    .frame(height: 250)
                ForEach(mainViewModel.order, id: \.self) { order in
                    buildViewInOrder(order: order)
                }
            })
        }
        .overlay(
            Color.white
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                .ignoresSafeArea(.all, edges: .top)
                .opacity(mainViewModel.offset > 250 ? 1 : 0)
            , alignment: .top
        )
        .background(.gray.opacity(0.2))
    }
    
    @ViewBuilder
    func buildViewInOrder(order: String) -> some View {
        switch order {
        case "vip": premiumSectionView
        case "categories": categoriesSection
        case "examples": collectionWorkView
        case "catalog": cathalogView
        default: EmptyView()
        }
    }
    
    private var premiumSectionView: some View {
        VStack {
            HStack {
                Text("Премиум")
                    .padding(.trailing, 4)
                    .font(.system(size: 24, weight: .bold))
                
                Text(String(mainViewModel.premiumCount))
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("Реклама")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                    .padding(3)
                    .background(
                        RoundedRectangle(cornerRadius: 2)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                    )
            }
            
            VStack {
                ForEach(mainViewModel.premiumSection) { prem in
                    PremiumSectionView(premium: prem)
                }
            }
        }
        .padding()
        .background(.white)
    }
    
    private var categoriesSection: some View {
        
        VStack {
            Rectangle()
                .background(Color.gray)
                .frame(height: 1)
                .opacity(0.2)
            
            HStack {
                Text("Категории")
                    .padding(.trailing, 4)
                    .font(.system(size: 24, weight: .bold))
                
                Text("\(mainViewModel.categoriesSection.count)")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.gray)
                
                Spacer()
            }
//Внесены изменения
            ScrollView(.horizontal) {
                LazyHGrid(rows: items, alignment: .top, spacing: 10, content: {
                    ForEach($mainViewModel.categoriesSection, id: \.self) { category in
                        CategoriesSectionView(categories: category)
                    }
                })
            }
        }
        .padding()
        .background(Color.white)
    }
    
    private var collectionWorkView: some View {
        VStack {
            Rectangle()
                .background(Color.gray)
                .frame(height: 1)
                .opacity(0.2)
                .padding(.horizontal, 8)
            
            HStack {
                Text("Коллекция работ")
                    .font(.system(size: 24, weight: .bold))
                
                Spacer()
            }
            .padding(8)
            .background(.white)
            
            ImageFromURL(urlString: mainViewModel.examplesWorkImage)
            
            HStack {
                Text("Посмотрите фото работ и выберите куда записаться")
                    .lineLimit(2)
                    .font(.system(size: 12, weight: .medium))
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Button {
                    showAllert.toggle()
                } label: {
                    Text("Посмотреть")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.blue)
                        .padding(4)
                        .background(
                            RoundedRectangle(cornerRadius: 2)
                                .foregroundColor(.gray)
                                .opacity(0.3)
                        )
                }
                .alert(isPresented: $showAllert) { () -> Alert in
                    Alert(title: Text(""),
                          message: Text("Требуется регистрация"),
                          dismissButton: .default(Text("Хорошо")))
                }
            }
            .padding(.horizontal, 8)
            .background(.white)
        }
    }
    
    private var cathalogView: some View {
        VStack {
            Rectangle()
                .background(Color.gray)
                .frame(height: 1)
                .opacity(0.2)
            
            HStack {
                Text("Каталог")
                    .padding(.trailing, 4)
                    .font(.system(size: 24, weight: .bold))
                
                Text(mainViewModel.cathalogCount)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.gray)
                
                Spacer()
            }
            
            ForEach(mainViewModel.cathalogSection) { catalod in
                CatalogSectionView(cathalog: catalod)
            }
        }
        .padding()
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
