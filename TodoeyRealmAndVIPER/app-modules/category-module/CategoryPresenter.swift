//
//  CategoryPresenter.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/19/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryPresenter {
    weak var view: CategoryPresenterViewDelegate?
    var router: CategoryPresenterRouterDelegate?
    var interactor: CategoryPresenterInteractorDelegate?
    private var categoryList: Results<Category>?
}

extension CategoryPresenter: CategoryViewPresenterDelegate {
    func deleteCategory(at indexPath: IndexPath) {
        if let category = categoryList?[indexPath.row] {
            interactor?.delete(category: category)
        }
    }
    
    func notifyViewLoaded() {
        view?.setupUIViewElements()
    }
    
    func notifyViewWillAppear() {
        view?.showLoading()
        //Simulating a query delay for seeing the Loading component, just for testing purpose
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
            self.interactor?.fetchCategoryList()
        }
    }
    
    func addNewCategory(categoryName: String) {
        let category = Category()
        category.name = categoryName
        interactor?.saveCategory(category: category)
    }
    
    func categorySelected(_ indexPath: IndexPath) {
        router?.pushToCategoryViewController(categoryList?[indexPath.row])
    }
    
    func getCategoryList() -> Results<Category>? {
        return categoryList
    }
    
}

extension CategoryPresenter: CategoryInteractorPresenterDelegate {
    func requestCompleted() {
        view?.reloadData()
    }
    
    func requestFailed(error: RealmError) {
        print("ERROR: \(error)")
    }
    
    func categoryFetched(_ categoryList: Results<Category>) {
        self.categoryList = categoryList
        view?.reloadData()
        view?.hideLoading()
    }
    
}
