//
//  CategoryProtocols.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/19/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import Foundation

//MARK: - CategoryPresenter -> CategoryViewController
protocol CategoryPresenterViewDelegate: AnyObject {
    func showLoading()
    func hideLoading()
    func setupUIViewElements()
    func reloadData()
}
