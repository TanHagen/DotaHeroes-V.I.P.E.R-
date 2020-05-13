//
//  CollectionViewCell.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import UIKit

final class HeroCollectionViewCell: UICollectionViewCell {
    
    static let reusableIdentifier = "HeroCollectionViewCell"
    
    private var container: UIView = {
        let container = UIView()
        container.backgroundColor = #colorLiteral(red: 0.8724230528, green: 0.9164030552, blue: 0.9663124681, alpha: 1)
        container.clipsToBounds = true
        return container
    }()
    
    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.backgroundColor = #colorLiteral(red: 0.8724230528, green: 0.9164030552, blue: 0.9663124681, alpha: 1)
        nameLabel.textColor = UIColor.black
        nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.2
        return nameLabel
    }()
    
    var heroImage: UIImageView = {
       let heroImage = UIImageView()
        heroImage.layer.cornerRadius = 10
        heroImage.contentMode = .scaleAspectFill
        heroImage.clipsToBounds = true
        heroImage.backgroundColor = #colorLiteral(red: 0.8724230528, green: 0.9164030552, blue: 0.9663124681, alpha: 1)
        return heroImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.8724230528, green: 0.9164030552, blue: 0.9663124681, alpha: 1)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setConstraints() {
        
        self.contentView.addSubview(container)
        container.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        container.addSubview(heroImage)
        heroImage.snp.makeConstraints { (make) in
            make.top.equalTo(container.snp.top)
            make.left.equalTo(container.snp.left)
            make.width.equalToSuperview()
            make.height.equalTo(65)
        }
        
        container.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(heroImage.snp.bottom)
            make.left.equalTo(container.snp.left)
            make.width.equalToSuperview()
            make.height.equalTo(20)
        }
    }
}


