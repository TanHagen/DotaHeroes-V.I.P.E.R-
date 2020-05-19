//
//  MainPresenterProtocol.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

protocol MainPresenterProtocol: class {
    
    var router: MainRouterProtocol { get set }
    var interactor: MainInteractorProtocol { get set }
    
    func prepareForFetch()
    func prepareToDelete()
    func goToDetailViewControllerWith(hero: Hero)
}
