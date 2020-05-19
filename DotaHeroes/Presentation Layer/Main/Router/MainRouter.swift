//
//  MainRouter.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import UIKit

final class MainRouter: MainRouterProtocol {
    
    weak var view: UIViewController?
    
    func goToDetailViewController(hero: Hero) {
        let detailViewController = DetailAssembly.makeDetailAssembly(hero: hero)
        view?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
