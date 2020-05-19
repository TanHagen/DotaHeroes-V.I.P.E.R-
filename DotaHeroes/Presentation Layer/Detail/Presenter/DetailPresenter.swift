//
//  DetailPresenter.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

final class DetailPresenter: DetailPresenterProtocol {
    
    private weak var view: DetailViewControllerProtocol?
    var router: DetailRouterProtocol
    var interactor: DetailInteractorProtocol
    
    init(view: DetailViewControllerProtocol, interactor: DetailInteractorProtocol, router: DetailRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
