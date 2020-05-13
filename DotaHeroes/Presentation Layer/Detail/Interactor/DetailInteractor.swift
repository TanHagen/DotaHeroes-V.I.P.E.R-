//
//  DetailInteractor.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

final class DetailInteractor: DetailInteractorProtocol {
    
    weak var presenter: DetailPresenterProtocol!
    
    required init(presenter: DetailPresenterProtocol) {
        self.presenter = presenter
    }
    
}
