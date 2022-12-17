//
//  TabContainerView.swift
//  OnlineService_TestTask
//
//  Created by Поляндий on 17.12.2022.
//

import Foundation
import SwiftUI

struct TabContainerView: View {
    
    @StateObject private var tabContainerViewModel = TabContainerViewModel()
    
    var body: some View {
        TabView(selection: $tabContainerViewModel.selectedTab) {
            ForEach(tabContainerViewModel.tabItemViewModel, id: \.self) { viewModel in
                tabView(for: viewModel.type)
                    .tabItem {
                        Image(systemName: viewModel.ImageName)
                        Text(viewModel.title)
                    }.tag(viewModel.type)
            }
        }
    }
    
    @ViewBuilder
    func tabView(for tabItemView: TabItemViewModel.TabItemType) -> some View {
        switch tabItemView {
        case .main:
            MainView()
        case .sales:
            Text("Пока что акций нет")
        case .myRecords:
            Text("Вы еще не произвели запись")
        case .chats:
            Text("Чатики")
        case .more:
            Text("Возможно есть что-то еще))")
        }
    }
}
