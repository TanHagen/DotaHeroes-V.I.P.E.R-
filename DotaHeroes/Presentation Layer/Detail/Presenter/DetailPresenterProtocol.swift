//
//  DetailPresenterProtocol.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

protocol DetailPresenterProtocol: class {
    
    var router: DetailRouterProtocol! { set get }
    var interactor: DetailInteractorProtocol! { set get }
    
}
