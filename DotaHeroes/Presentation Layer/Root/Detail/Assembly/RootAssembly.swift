//
//  RootAssembly.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import UIKit

class RootAssembly: RootAssemblyProtocol {

    let dependency: RootDependency
    
    init(dependency: RootDependency) {
        self.dependency = dependency
    }
    
    func makeRootAssembly() -> UIViewController {
        
        let builders: RootBuilders = Builders(mainModule: MainAssembly(dependency: dependency),
                                              detailMidule: DetailAssembly(dependency: dependency))
        
        let viewController = RootViewController(builders: builders)
        let interactor: RootInteractorProtocol = RootInteractor()
        let router: RootRouterProtocol = RootRouter()
        let presenter: RootPresenterProtocol = RootPresenter(view: viewController, interactor: interactor, router: router)
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.view = viewController
        
        return viewController
    }
}
