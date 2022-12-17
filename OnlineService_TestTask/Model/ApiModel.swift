//
//  ApiModel.swift
//  OnlineService_TestTask
//
//  Created by Поляндий on 17.12.2022.
//

import Foundation

struct ApiModel: Codable {
    let errorMessage: ErrorMessage
    let data: MainData
    
    private enum CodingKeys: String, CodingKey {
        case errorMessage = "error"
        case data = "data"
    }
}

struct ErrorMessage: Codable {
    let code: Int
    let message: String?
    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case message = "message"
    }
}

struct MainData: Codable {
    let title: String
    let mainImageURL: String
    let catalogCount: String
    let blocks: Blocks
    let order: [String]
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case mainImageURL = "image"
        case catalogCount = "catalog_count"
        case blocks = "blocks"
        case order = "order"
    }
}

struct Blocks: Codable {
    let vip: [PremiumSection]
    let examples: String
    let catalog: [CatalogSection]
    
    private enum CodingKeys: String, CodingKey {
        case vip = "vip"
        case examples = "examples"
        case catalog = "catalog"
    }
}

struct PremiumSection: Codable, Identifiable {
    let id: String
    let images: ImageSection
    let name: String
    let categories: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case images = "image"
        case name = "name"
        case categories = "categories"
    }
}

struct ImageSection: Codable {
    let thumbURL: String
    let originURL: String
    
    private enum CodingKeys: String, CodingKey {
        case thumbURL = "thumb"
        case originURL = "origin"
    }
}

struct CatalogSection: Codable, Identifiable {
    let id: String
    let name: String
    let images: ImageSection
    let street: String
    let house: String
    let lat: String
    let lng: String
    let categories: [String]?
    let rating: Double
    let isMaster: Bool
    let currency: CurrencySection
    let masterID: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case images = "image"
        case street = "street"
        case house = "house"
        case lat = "lat"
        case lng = "lng"
        case categories = "categories"
        case rating = "rating"
        case isMaster = "isMaster"
        case currency = "currency"
        case masterID = "master_id"
    }
}

struct CurrencySection: Codable {
    let id: String
    let title: String
    let abbr: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case abbr = "abbr"
    }
}
