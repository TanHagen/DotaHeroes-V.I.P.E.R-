//
//  MainAssembly.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import UIKit

class MainAssembly: MainAssemblyProtocol {
    
    let dependency: MainDependency
    
    init(dependency: MainDependency) {
        self.dependency = dependency
    }

    func makeMainAssembly() -> UIViewController {
        
        let viewController = MainViewController()
        let interactor: MainInteractorProtocol = MainInteractor(service: dependency.heroService)
        let router: MainRouterProtocol = MainRouter()
        let presenter: MainPresenterProtocol = MainPresenter(view: viewController, interactor: interactor, router: router)
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.view = viewController
        
        return viewController
    }
}

