//
//  HTTPClient.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 11.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

protocol HTTPClientProtocol {
    func request<T: Codable>(urlRequest: URLRequest, completion: @escaping (Result<T, APIError>) -> Void)
}

class HTTPClient: HTTPClientProtocol {
    
    // MARK: - Properties
    
    private let urlSession: URLSession = URLSession.shared
    
    private let decoder: JSONDecoder = JSONDecoder()
    
    // MARK: - HTTPClient
    
    func request<T: Codable>(urlRequest: URLRequest, completion: @escaping (Result<T, APIError>) -> Void) {
        urlSession.dataTask(with: urlRequest) { [weak self] (result: Result<(URLResponse, Data), APIError>) in
            guard let self = self else {
                return
            }
            
            switch result {
            case let .success(success):
                let (_, data) = success
                do {
                    let entity = try self.decoder.decode(T.self, from: data)
                    completion(.success(entity))
                } catch {
                    completion(.failure(APIError.decodingError))
                }
            case let .failure(error):
                completion(.failure(.error(error)))
            }
        }.resume()
    
    }
}
