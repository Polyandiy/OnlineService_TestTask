//
//  TabContainerViewModel.swift
//  OnlineService_TestTask
//
//  Created by Поляндий on 17.12.2022.
//

import Foundation
import SwiftUI

final class TabContainerViewModel: ObservableObject {
    
    @Published var selectedTab: TabItemViewModel.TabItemType = .main
    
    let tabItemViewModel = [
        TabItemViewModel(ImageName: "homekit", title: "Главная", type: .main),
        TabItemViewModel(ImageName: "percent", title: "Акции", type: .sales),
        TabItemViewModel(ImageName: "book", title: "Мои записи", type: .myRecords),
        TabItemViewModel(ImageName: "text.bubble", title: "Чаты", type: .chats),
        TabItemViewModel(ImageName: "line.3.horizontal", title: "Еще", type: .more)
    ]
}

struct TabItemViewModel: Hashable {
    let ImageName: String
    let title: String
    let type: TabItemType
    
    enum TabItemType {
        case main
        case sales
        case myRecords
        case chats
        case more
    }
}
