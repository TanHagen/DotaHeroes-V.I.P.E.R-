//
//  MainAssembly.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

class MainAssembly: MainAssemblyProtocol {

    static func makeMainAssembly() -> MainViewController {
        
        let httpClient = HTTPClient()
        let service = HeroesService(httpClient: httpClient)
        let viewController = MainViewController()
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter, service: service)
        let router = MainRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        return viewController
    }
}
