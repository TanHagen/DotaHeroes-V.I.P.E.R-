//
//  MainPresenterProtocol.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

protocol MainPresenterProtocol: class {
    
    var router: MainRouterProtocol! { set get }
    var interactor: MainInteractorProtocol! { set get }
    
    func getHeroesData(completion: @escaping ([Hero]) -> Void)
    func goToDetailViewControllerWith(hero: Hero)
    
}
