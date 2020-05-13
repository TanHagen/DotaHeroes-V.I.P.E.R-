//
//  DetailViewController.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController, DetailViewControllerProtocol {
    
    var presenter: DetailPresenterProtocol!
    
    let attackType = "Тип атаки: "
    let primmaryAttribute = "Главный аттрибут: "
    
    var heroImageLogo: UIImageView = {
        let heroImageLogo = UIImageView()
        return heroImageLogo
    }()
    
    var heroImageBig: UIImageView = {
        let heroImageBig = UIImageView()
        heroImageBig.contentMode = .scaleToFill
        return heroImageBig
    }()
    
    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    
    var attackTypeLabel: UILabel = {
        let attackTypeLabel = UILabel()
        attackTypeLabel.font = .systemFont(ofSize: 17)
        attackTypeLabel.textAlignment = .center
        return attackTypeLabel
    }()
    
    var primmaryAttributeLabel: UILabel = {
        let primmaryAttributeLabel = UILabel()
        primmaryAttributeLabel.font = .systemFont(ofSize: 17)
        primmaryAttributeLabel.textAlignment = .center
        return primmaryAttributeLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8724230528, green: 0.9164030552, blue: 0.9663124681, alpha: 1)
        variablesConfigure()
    }
    
    func variablesConfigure() {
        
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
    
    func updateView(hero: Hero) {
        
        heroImageBig.downloadedFrom(link: hero.imageLink)
        heroImageLogo.downloadedFrom(link: hero.iconLink)
        nameLabel.text = hero.localizedName
        attackTypeLabel.text = hero.attackType.rawValue
        primmaryAttributeLabel.text = hero.primaryAttribute.rawValue
    }
    
    deinit {
        let file = (#file as NSString).lastPathComponent
        print("\(file) deinit")
    }
}
