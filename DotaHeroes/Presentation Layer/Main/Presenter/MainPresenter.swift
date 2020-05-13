//
//  MainPresenter.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

final class MainPresenter: MainPresenterProtocol {

    private weak var view: MainViewControllerProtocol?
    var router: MainRouterProtocol!
    var interactor: MainInteractorProtocol!
    
    init(view: MainViewControllerProtocol) {
        self.view = view
    }
    
    func getHeroesData(completion: @escaping ([Hero]) -> Void) {
        interactor.getHeroesData { (result) in
            switch result {
            case let .success(heroes):
                completion(heroes)
            case let .failure(error):
                print("Ошибка при получении данных о героях", error.localizedDescription)
            }
        }
    }
    
    func goToDetailViewControllerWith(hero: Hero) {
        self.router.goToDetailViewController(hero: hero)
    }

}
