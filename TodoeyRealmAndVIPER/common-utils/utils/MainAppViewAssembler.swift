//
//  MainAppViewAssembler.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/23/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class MainAppViewAssembler {
    
    func setMainScreen(on window: inout UIWindow?) {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.backgroundColor = .lightGray
        let categoryViewController = CategoryRouter.createModule(on: navigationController)
        navigationController.viewControllers = [categoryViewController]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
