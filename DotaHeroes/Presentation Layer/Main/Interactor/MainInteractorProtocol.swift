//
//  MainInteractorProtocol.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

protocol MainInteractorProtocol: class {
    
    func getHeroesData(completion: @escaping (Result<[Hero], APIError>) -> Void)
    
}
