//
//  MainInteractorProtocol.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

protocol MainInteractorProtocol: class {
    
    var presenter: MainPresenterProtocol? { get set }
    var heroesArray: [Hero] { get set }
    
    func getHeroesData(completion: @escaping (MainPresenter.Action) -> Void)
    func deleteHeroesAlert(completion: @escaping (MainPresenter.Action) -> Void)
}
