//
//  APIError.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 11.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

enum APIError: Error {
    
    case decodingError
    case invalidResponse
    case error(Error)
}
