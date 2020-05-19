//
//  DetailPresenterProtocol.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

protocol RootPresenterProtocol: class {
    
    var router: RootRouterProtocol { set get }
    var interactor: RootInteractorProtocol { set get }
}
