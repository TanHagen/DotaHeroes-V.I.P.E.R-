//
//  RootDependency.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 19.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

protocol RootDependency: MainDependency, DetailDependency  {
    
    var heroService: HeroesServiceProtocol { get }
}
