//
//  ItemPresenterInteractorDelegate.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/21/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import Foundation
//MARK: - Presenter -> Interactor
protocol ItemPresenterInteractorDelegate {
    func saveItem(_ parentCategory: Category, _ item: Item)
    func update(item: Item)
    func delete(item: Item)
}
