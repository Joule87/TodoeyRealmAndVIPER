//
//  CategoryPresenterDelegate.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/19/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import Foundation
import RealmSwift
//MARK:- CategoryView -> CategoryPresenter

protocol CategoryViewPresenterDelegate {
    func notifyViewLoaded()
    func notifyViewWillAppear()
    func addNewCategory(categoryName: String)
    func categorySelected(_ indexPath: IndexPath)
    func getCategoryList() -> Results<Category>?
}

//MARK:- CategoryInteractor -> CategoryPresenter
protocol CategoryInteractorPresenterDelegate: AnyObject {
    func categoryFetched(_ categoryList: Results<Category>)
    func categoryFetchFailed()
    func requestCompleted()
    func requestFailed(error: RealmError)
}
