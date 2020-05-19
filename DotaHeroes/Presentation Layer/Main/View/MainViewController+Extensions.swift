//
//  MainViewController+Extensions.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import UIKit

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if presenter.interactor.heroesArray.indices.contains(indexPath.row) {
    
            let heroesIndex = presenter.interactor.heroesArray[indexPath.row]
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroCollectionViewCell.reusableIdentifier, for: indexPath) as! HeroCollectionViewCell
            cell.heroImage.getImageFrom(link: heroesIndex.imageLink)
            cell.nameLabel.text = heroesIndex.localizedName
            
            return cell
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.interactor.heroesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let tappedHero = presenter.interactor.heroesArray[indexPath.row]
    
        presenter.goToDetailViewControllerWith(hero: tappedHero)
    }
}

