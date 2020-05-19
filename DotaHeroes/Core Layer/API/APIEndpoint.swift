//
//  APIEndpoint.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 11.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation
import Alamofire

protocol APIEndpoint: URLRequestConvertible {
    
    var method: HTTPMethod { get }
    
    var path: String { get }
    
    func asURLRequest() throws -> URLRequest
}
