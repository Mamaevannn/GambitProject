//
//  NetworkService.swift
//  GambitProject
//
//  Created by Наида Мамаева on 11.03.2022.
//

import Foundation

class NetworkService {
    private init(){}
    
        static let shared = NetworkService()
  
    public func getData(url: URL, completion: @escaping (Any) -> ()) {
            let session = URLSession.shared
            
            session.dataTask(with: url) { (data, response, error) in

                guard let data = data else {return}
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    DispatchQueue.main.async {
                        completion(json)
                    }
                } catch {
                    print(error)
                }
            }.resume()
        }
    
}

struct GetmenuResponse {
    let menuPosition: [Menu]
    
    init(json: Any) throws {
        guard let array = json as? [[String: AnyObject]] else {throw NetworkError.failInternetError}
        
        var menuPosition = [Menu]()
        for dictionary in array {
            guard let menu = Menu(dict: dictionary) else {continue}
            menuPosition.append(menu)
        }
        self.menuPosition = menuPosition
    }
}

class MenuNetworkService {
    private init() {}
    
    static func getMenu(completion: @escaping(GetmenuResponse) ->()) {
        guard let url = URL(string: "https://api.gambit-app.ru/category/39?page=1") else {return}
        
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response  = try GetmenuResponse(json: json)
                completion(response)
                
            } catch {
                print(error)
            }
        }
    }
}
