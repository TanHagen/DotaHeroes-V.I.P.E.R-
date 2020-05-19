//
//  DetailViewController.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController, RootViewControllerProtocol {
    
    var presenter: RootPresenterProtocol!
    let builders: RootBuilders
    
    init(builders: RootBuilders) {
        self.builders = builders
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showMainModule()
    }
    
    private func showMainModule() {
        let mainViewController = builders.mainModule.makeMainAssembly()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        addChild(navigationController)
        view.addSubview(navigationController.view)
    }
}
