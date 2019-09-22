//
//  CategoryPresenterInteractorDelegate.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/19/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import Foundation
//MARK: - Presenter -> Interactor
protocol CategoryPresenterInteractorDelegate {
    func fetchCategoryList()
    func saveCategory(category: Category)
    func delete(category: Category)
}
