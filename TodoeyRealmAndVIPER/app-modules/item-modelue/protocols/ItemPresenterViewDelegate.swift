//
//  ItemPresenterViewDelegate.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/21/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import Foundation
//MARK:- Presenter -> View
protocol ItemPresenterViewDelegate: AnyObject {
    func showLoading()
    func hideLoading()
    func setupUIViewElements()
    func reloadData()
    func hideEmptyView(_ isHidden: Bool)
}
