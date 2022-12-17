//
//  NetworkService.swift
//  OnlineService_TestTask
//
//  Created by Поляндий on 17.12.2022.
//

import Foundation

class NetworkService {
    
    static let networkService: NetworkService = NetworkService()
    
    func getRequest(completion: @escaping (ApiModel?) -> Void) {
        
        let url = self.url()
        print(url)
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("maJ9RyT4TJLt7bmvYXU7M3h4F797fUKofUf3373foN94q4peAM", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error)
                return
            }
            else if let data = data {
                do {
                    let decodeData = try JSONDecoder().decode(ApiModel.self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(decodeData)
                        print(decodeData)
                    }
                    
                } catch let error {
                    print("Decoding error - \(error.localizedDescription)")
                    completion(nil)
                }
            }
        }
        task.resume()
    }
    
    private func url() -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api-beauty.test.dikidi.ru"
        components.path = "/home/info"
        components.queryItems = [URLQueryItem(name: "city_id", value: "468902")]
        return components.url!
    }
}
