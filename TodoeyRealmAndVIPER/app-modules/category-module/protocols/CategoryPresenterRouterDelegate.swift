//
//  CategoryRouterDelegate.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/19/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

//MARK: -  Presenter -> Router
protocol CategoryPresenterRouterDelegate {
    static func createModule(on navigationController: UINavigationController)-> CategoryViewController
    func pushToCategoryViewController(_ category: Category?)
}
