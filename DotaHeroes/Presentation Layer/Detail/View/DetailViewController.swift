//
//  DetailViewController.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController, DetailViewControllerProtocol {
    
    // MARK: - Properties
    
    var presenter: DetailPresenterProtocol!
    
    private var heroImageLogo: UIImageView = {
        let heroImageLogo = UIImageView()
        return heroImageLogo
    }()
    
    private var heroImageBig: UIImageView = {
        let heroImageBig = UIImageView()
        heroImageBig.contentMode = .scaleAspectFit
        return heroImageBig
    }()
    
    private var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    
    private var attackTypeLabel: UILabel = {
        let attackTypeLabel = UILabel()
        attackTypeLabel.font = .systemFont(ofSize: 17)
        attackTypeLabel.textAlignment = .center
        return attackTypeLabel
    }()
    
    private var primmaryAttributeLabel: UILabel = {
        let primmaryAttributeLabel = UILabel()
        primmaryAttributeLabel.font = .systemFont(ofSize: 17)
        primmaryAttributeLabel.textAlignment = .center
        return primmaryAttributeLabel
    }()
    
    private let choosenHero: Hero
    
    init(hero: Hero) {
        choosenHero = hero
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8724230528, green: 0.9164030552, blue: 0.9663124681, alpha: 1)
        
        setHeroCharacteristics()
        setConstraints()
    }
    
    // MARK: - Layout
    
    private func setConstraints() {
        
        self.view.addSubview(heroImageBig)
        
        heroImageBig.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height/3)
            make.top.equalToSuperview().offset(58)
            make.left.equalToSuperview()
        }
        
        self.view.addSubview(heroImageLogo)
        
        heroImageLogo.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(heroImageBig.snp.bottom).offset(25)
            make.width.height.equalTo(30)
        }
        
        self.view.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(heroImageLogo.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(30)
        }
        
        self.view.addSubview(attackTypeLabel)
        
        attackTypeLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(40)
        }
        
        self.view.addSubview(primmaryAttributeLabel)
        primmaryAttributeLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(attackTypeLabel.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    
    private func setHeroCharacteristics() {
        self.heroImageBig.getImageFrom(link: choosenHero.imageLink)
        self.heroImageLogo.getImageFrom(link: choosenHero.iconLink)
        self.nameLabel.text = choosenHero.localizedName
        self.attackTypeLabel.text = choosenHero.attackType.rawValue
        self.primmaryAttributeLabel.text = choosenHero.primaryAttribute.rawValue
    }
}
