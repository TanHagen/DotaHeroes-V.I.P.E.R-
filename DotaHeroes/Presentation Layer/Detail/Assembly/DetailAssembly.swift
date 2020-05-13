//
//  DetailAssembly.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

class DetailAssembly: DetailAssemblyProtocol {

    static func makeDetailAssembly() -> DetailViewController {
        
        let viewController = DetailViewController()
        let presenter = DetailPresenter(view: viewController)
        let interactor = DetailInteractor(presenter: presenter)
        let router = DetailRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        return viewController
    }
}
