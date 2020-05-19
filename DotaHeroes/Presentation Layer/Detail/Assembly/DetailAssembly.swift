//
//  DetailAssembly.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import UIKit

class DetailAssembly: DetailAssemblyProtocol {
    
    let dependency: DetailDependency
     
     init(dependency: DetailDependency) {
         self.dependency = dependency
     }

    static func makeDetailAssembly(hero: Hero) -> UIViewController {
 
        let viewController = DetailViewController(hero: hero)
        let interactor: DetailInteractorProtocol = DetailInteractor()
        let router: DetailRouterProtocol = DetailRouter()
        let presenter: DetailPresenterProtocol = DetailPresenter(view: viewController, interactor: interactor, router: router)
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.view = viewController
        
        return viewController
    }
}
