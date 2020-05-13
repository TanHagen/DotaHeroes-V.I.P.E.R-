//
//  URLSession+Extensions.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 11.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

extension URLSession {
    
    func dataTask(with urlRequest: URLRequest, completion: @escaping (Result<(URLResponse, Data), APIError>) -> Void) -> URLSessionDataTask {
        
        return dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(.error(error)))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                completion(.failure(.error(error)))
                return
            }
            completion(.success((response, data)))
        }
    }
}
