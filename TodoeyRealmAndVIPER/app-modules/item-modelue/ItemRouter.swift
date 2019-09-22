//
//  ItemRouter.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/21/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class ItemRouter: ItemPresenterRouterDelegate {
    weak var navigationViewController: UINavigationController?
    
    static func createModule(on navigationController: UINavigationController) -> ItemViewController {
        let router = ItemRouter()
        let presenter = ItemPresenter()
        let interactor = ItemInteractor()
        
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ItemViewController.viewControllerIdentifier) as! ItemViewController
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.navigationViewController = navigationController
        
        
        return view
    }
    
}
