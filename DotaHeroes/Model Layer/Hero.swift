//
//  Hero.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

struct Hero {
    
    var localizedName: String
    var imageLink: String
    var primaryAttribute: HeroSkills.Attribute
    var attackType: HeroSkills.TypeAttack
    var iconLink: String

}

enum HeroSkills {
    
    enum Attribute: String {
        case agi = "Ловкость"
        case str = "Сила"
        case int = "Интелект"
        case none = "-"
    }

    enum TypeAttack: String {
        case melee = "Ближний бой"
        case ranged = "Дальний бой"
        case none = "-"
    }
    
}


