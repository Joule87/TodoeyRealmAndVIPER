//
//  ItemPresenterRouterDelegate.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/21/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit
//MARK: -  Presenter -> Router
protocol ItemPresenterRouterDelegate {
    static func createModule(on navigationController: UINavigationController) -> ItemViewController
}
