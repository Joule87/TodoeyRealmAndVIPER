//
//  CaategoryRouter.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/19/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class CategoryRouter {
    
    weak var navigationController: UINavigationController?
    
}

extension CategoryRouter: CategoryPresenterRouterDelegate {
    
    static func createModule(on navigationController: UINavigationController) -> CategoryViewController {

        let router = CategoryRouter()
        let presenter = CategoryPresenter()
        let interactor = CategoryInteractor()
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: CategoryViewController.viewControllerIdentifier) as! CategoryViewController

        view.presenter = presenter

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor

        interactor.presenter = presenter

        router.navigationController = navigationController


        return view
    }
    
    func pushToCategoryViewController(_ category: Category?) {
        guard let navigationController = navigationController else {
            return
        }
        let itemViewController = ItemRouter.createModule(on: navigationController)
        itemViewController.presenter?.selectedCategory = category
        navigationController.pushViewController(itemViewController, animated: true)
    }
    
    func popBack() {
        
    }
    
}
