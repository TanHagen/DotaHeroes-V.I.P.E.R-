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
    
    weak var presenter: MainPresenterProtocol?

    var heroesArray = [Hero]()
    
    init(service: HeroesServiceProtocol) {
        self.heroService = service
    }
    
    func getHeroesData(completion: @escaping (MainPresenter.Action) -> Void) {
        
        heroService.getHeroes { [weak self] (result) in
        guard let self = self else { return }
            switch result {
            case .success(let heroes):
                self.heroesArray = heroes
                completion(.reloadData)
            case .failure(let error):
                print(ConstantsString.errorInFunction, error.localizedDescription)
            }
        }
    }
    
    func deleteHeroesAlert(completion: @escaping (MainPresenter.Action) -> Void) {
        self.heroesArray.removeAll()
        completion(.reloadData)
    }
}
