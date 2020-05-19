//
//  MainPresenter.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

final class MainPresenter: MainPresenterProtocol {
    
    enum Action {
        case reloadData
    }
    
    private weak var view: MainViewControllerProtocol?
    var router: MainRouterProtocol
    var interactor: MainInteractorProtocol
    
    init(view: MainViewControllerProtocol, interactor: MainInteractorProtocol, router: MainRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func prepareForFetch() {
        interactor.getHeroesData { (action) in
            guard let view = self.view else { return }

            if case .reloadData = action {
                view.reloadData()
            }
        }
    }
    
    func prepareToDelete() {
        interactor.deleteHeroesAlert { (action) in
            guard let view = self.view else { return }
            
            if case .reloadData = action {
                view.reloadData()
            }
        }
    }
    
    func goToDetailViewControllerWith(hero: Hero) {
        self.router.goToDetailViewController(hero: hero)
    }
}
