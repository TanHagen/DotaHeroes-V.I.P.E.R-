//
//  APIManagerJSON.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import Foundation

protocol HeroesServiceProtocol {
    func getHeroes(completion: @escaping (Result<[Hero], APIError>) -> Void)
}

final class HeroesService: HeroesServiceProtocol {
    
    private let httpClient: HTTPClientProtocol
    
    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
    
    func getHeroes(completion: @escaping (Result<[Hero], APIError>) -> Void) {
        
        do {
            let urlRequest = try API.Heroes.getHeroesData.asURLRequest()
            httpClient.request(urlRequest: urlRequest) { (result: Result<[API.Heroes.Hero], APIError>) in
                switch result {
                case .success(let data):
                    let heroes = self.mapToHero(data: data)
                    completion(.success(heroes))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } catch {
            completion(.failure(.error(error)))
        }
    }
    
    
    private func mapToHero(data: [API.Heroes.Hero]) -> [Hero] {
    
        var heroes = [Hero]()
        
        data.forEach { (hero) in
            let heroAttr: HeroSkills.Attribute = {
                switch hero.primaryAttribute {
                case "agi":
                    return .agi
                case "int":
                    return .int
                case "str":
                    return .str
                default:
                    return .none
                }
            }()
            
            let heroType: HeroSkills.TypeAttack = {
                switch hero.attackType {
                case "Melee":
                    return .melee
                case "Ranged":
                    return .ranged
                default:
                    return .none
                }
            }()
            
            let mappedHero = Hero(localizedName: hero.localizedName,
                                  imageLink: API.baseURLString + hero.imageLink,
                                  primaryAttribute: heroAttr,
                                  attackType: heroType,
                                  iconLink: API.baseURLString + hero.iconLink)
            heroes.append(mappedHero)
        }
        
        return heroes
    }
}
