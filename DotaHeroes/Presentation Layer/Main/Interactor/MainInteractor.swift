//
//  MainInteractor.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

final class MainInteractor: MainInteractorProtocol {
    
    private var heroService: HeroesServiceProtocol
    
    weak var presenter: MainPresenterProtocol!

    required init(presenter: MainPresenterProtocol, service: HeroesServiceProtocol) {
        self.presenter = presenter
        self.heroService = service
    }
    
    func getHeroesData(completion: @escaping (Result<[Hero], APIError>) -> Void) {
        
        heroService.getHeroes { (result) in
            completion(result)
        }
    }
}
