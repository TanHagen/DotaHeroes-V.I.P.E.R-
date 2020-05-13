//
//  API+Gists.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 11.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation
import Alamofire

extension API {
    
    enum Heroes: APIEndpoint {
        
        case getHeroesData
        
        var method: HTTPMethod {
            switch self {
            case .getHeroesData:
                return .get
            }
        }
        
        var path: String {
            switch self {
            case .getHeroesData:
                return "/api/heroStats"
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            let url = try API.baseURLString.asURL()
            
            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            switch self {
            case .getHeroesData:
                urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
            }
            
            return urlRequest
        }
    }
}

extension API.Heroes {
    
    struct Hero: Codable {
        
        var localizedName: String
        var imageLink: String
        var primaryAttribute: String
        var attackType: String
        var iconLink: String

        private enum CodingKeys: String, CodingKey {
            case localizedName = "localized_name"
            case imageLink = "img"
            case primaryAttribute = "primary_attr"
            case attackType = "attack_type"
            case iconLink = "icon"
        }
    }
}
