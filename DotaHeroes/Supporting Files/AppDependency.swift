//
//  AppDependency.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 18.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

class AppDependency: RootDependency {
    
    static let shared = AppDependency()
    
    private(set) lazy var httpClient: HTTPClientProtocol = HTTPClient()
    private(set) lazy var heroService: HeroesServiceProtocol = HeroesService(httpClient: httpClient)
}

