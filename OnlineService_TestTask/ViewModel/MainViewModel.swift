//
//  MainViewModel.swift
//  OnlineService_TestTask
//
//  Created by Поляндий on 17.12.2022.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var modelData: ApiModel?
    @Published var offset: CGFloat = 0
    
    init() {
        fetchData()
    }
    
    var order: [String] {
        modelData?.data.order ?? ["vip", "examples", "categories", "catalog"]
    }
    
    var mainDescription: String {
        modelData?.data.title ?? ""
    }
    
    var premiumCount: String {
        if let count = modelData?.data.blocks.vip.count {
            return String(count)
        } else {
            return ""
        }
    }
    
    var premiumSection: [PremiumSection] {
        if let premium = modelData?.data.blocks.vip {
            return premium
        } else {
            return []
        }
    }
    
    @State var categoriesSection: [String] = [
        //        modelData?.data.blocks.vip[1].categories
        "Парикмахерские услуги",         "Ногтевой сервис",
        "Ресницы",                       "Депиляция, эпиляция",
        "Брови",                         "Косметология, уход",
        "Визаж",                         "Массаж",
        "СПА",                           "Татуаж, тату",
        "Усы, борода",                   "Прочие",
        "Барбершоп",                     "Медицина",
        "Стоматология",                  "Анализы",
        "Фитнес",                        "Единоборства",
        "Йога",                          "Танцы",
        "Шиномонтаж",                    "Автосервис",
        "Автомойка",                     "Техосмотр",
        "Ветеринария",                   "Груминг",
        "Квест",                         "Сауна",
        "Ресторан",                      "Киберспорт",
        "Боулинг",                       "Автошкола",
        "Репетитор",                     "Курсы",
        "Языковая школа",                "Фотостудия",
        "Аренда",                        "Коворкинг",
        "Клининг",                       "Психология"
    ]
    
    var examplesWorkImage: String {
        if let exampleURL = modelData?.data.blocks.examples {
            return exampleURL
        }
        return ""
    }
    
    var cathalogSection: [CatalogSection] {
        if let cathalog = modelData?.data.blocks.catalog {
            return cathalog
        } else {
            return []
        }
    }
    
    var cathalogCount: String {
        if let count = modelData?.data.blocks.catalog.count {
            return String(count)
        } else {
            return ""
        }
    }
    
    func fetchData() {
        DispatchQueue.main.async {
            NetworkService.networkService.getRequest { [weak self] data in
                guard data != nil else { return }
                self?.modelData = data
            }
        }
    }
}
