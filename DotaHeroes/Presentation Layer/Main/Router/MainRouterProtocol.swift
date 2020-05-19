//
//  MainRouterProtocol.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import UIKit

protocol MainRouterProtocol: class {
    
    var view: UIViewController? { get set }
    
    func goToDetailViewController(hero: Hero)
}
