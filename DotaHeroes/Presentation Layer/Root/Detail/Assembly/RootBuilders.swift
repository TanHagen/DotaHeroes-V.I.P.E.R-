//
//  RootBuilders.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 19.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

protocol RootBuilders {
    
    var mainModule: MainAssemblyProtocol { get }
    var detailMidule: DetailAssemblyProtocol { get }
}
