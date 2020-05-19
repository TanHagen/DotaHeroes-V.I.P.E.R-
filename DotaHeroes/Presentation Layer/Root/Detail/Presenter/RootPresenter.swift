//
//  DetailPresenter.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

final class RootPresenter: RootPresenterProtocol {
    
    private weak var view: RootViewControllerProtocol?
    var router: RootRouterProtocol
    var interactor: RootInteractorProtocol
    
    init(view: RootViewControllerProtocol, interactor: RootInteractorProtocol, router: RootRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
