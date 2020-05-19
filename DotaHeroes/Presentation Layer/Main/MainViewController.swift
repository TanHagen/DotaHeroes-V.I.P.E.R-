//
//  ViewController.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController, MainViewControllerProtocol {
    
    // MARK: - Properties
    
    var presenter: MainPresenterProtocol!
    
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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8724230528, green: 0.9164030552, blue: 0.9663124681, alpha: 1)
        setupNavigationBar()
        getHeroesData()
        setCollectionView()
    }
    
    // MARK: - Layout
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func getHeroesData() {
        presenter.prepareForFetch()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = ConstantsString.dota2heroes
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteHeroes))
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
    }
    
    @objc func refresh() {
        getHeroesData()
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    @objc func deleteHeroes() {
        let alert = UIAlertController(title: ConstantsString.attention, message: ConstantsString.reallyWantToRemoveData, preferredStyle: .actionSheet)
        let delete = UIAlertAction(title: ConstantsString.delete, style: .destructive) {
            (action: UIAlertAction) -> Void in
            self.presenter.prepareToDelete()
        }
        let cancel = UIAlertAction(title: ConstantsString.cancel, style: .cancel , handler: nil)
        alert.addAction(delete)
        alert.addAction(cancel)
        alert.view.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        present(alert, animated: true, completion: nil)
    }
}
