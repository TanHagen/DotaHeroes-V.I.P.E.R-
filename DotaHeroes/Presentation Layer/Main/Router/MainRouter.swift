//
//  MainRouter.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import UIKit

final class MainRouter: MainRouterProtocol {
    
    weak var viewController: UIViewController!
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func goToDetailViewController(hero: Hero) {
        let detailViewController = DetailAssembly.makeDetailAssembly(hero: hero)
        viewController.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
