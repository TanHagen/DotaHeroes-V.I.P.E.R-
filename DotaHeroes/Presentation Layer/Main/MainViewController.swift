//
//  ViewController.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController, MainViewControllerProtocol {
    
    var presenter: MainPresenterProtocol!
    //let configurator: MainConfiguratorProtocol = MainConfigurator()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let width: CGFloat = (UIScreen.main.bounds.width - 40)/3
        let height: CGFloat = 85
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(HeroCollectionViewCell.self, forCellWithReuseIdentifier: HeroCollectionViewCell.reusableIdentifier)
        collectionView.backgroundColor = #colorLiteral(red: 0.8724230528, green: 0.9164030552, blue: 0.9663124681, alpha: 1)
        collectionView.alwaysBounceVertical = true
        return collectionView
    }()
    
    var heroesArray = [Hero]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8724230528, green: 0.9164030552, blue: 0.9663124681, alpha: 1)
        //configurator.configure(with: self)
        setNavigation()
        getHeroesData()
        setCollectionView()
    }
    
    func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func getHeroesData() {
        presenter.getHeroesData { (heroes) in
            self.heroesArray = heroes
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func setNavigation() {
        navigationItem.title = "Dota2 Heroes"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteHeroes))
    }
    
    @objc func refresh() {
        getHeroesData()
    }
    
    @objc func deleteHeroes() {
        let alert = UIAlertController(title: "Внимание!", message: "Вы точно хотите удалить данные?", preferredStyle: .actionSheet)
        let delete = UIAlertAction(title: "Удалить", style: .destructive) {
            (action: UIAlertAction) -> Void in
            self.heroesArray.removeAll()
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel , handler: nil)
        alert.addAction(delete)
        alert.addAction(cancel)
        alert.view.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        present(alert, animated: true, completion: nil)
    }
}
