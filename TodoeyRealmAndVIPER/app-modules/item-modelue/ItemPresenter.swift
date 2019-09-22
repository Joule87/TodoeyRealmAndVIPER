//
//  ItemPresenter.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/21/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import Foundation
import RealmSwift

class ItemPresenter {
    weak var view: ItemPresenterViewDelegate?
    var router: ItemPresenterRouterDelegate?
    var interactor: ItemPresenterInteractorDelegate?
    var selectedCategory: Category?
}

extension ItemPresenter: ItemViewPresenterDelegate {
    func notifyViewDidLoad() {
        view?.setupUIViewElements()
    }
    
    func notifyViewWillAppear() {
        
    }
    
    func didSelectItem(_ indexPath: IndexPath) {
        guard let parentCategory = selectedCategory else {
            return
        }
        interactor?.update(item: parentCategory.items[indexPath.row])
    }
    
    func addNewItem(name: String, done: Bool) {
        guard let parentCategory = selectedCategory else {
            return
        }
        let item = Item()
        item.title = name
        item.done = done
        interactor?.saveItem(parentCategory, item)
    }
    
    func getItemList() -> Results<Item>? {
        guard let category = selectedCategory, category.items.count > 0 else {
            view?.hideEmptyView(false)
            return nil
        }
        view?.hideEmptyView(true)
        return category.items.sorted(byKeyPath: "title", ascending: true)
    }
    
    
}

extension ItemPresenter: ItemInteractorPresenterDelegate {
    func requestFailed(error: RealmError) {
        print("ERROR TRYING TO SAVE ITEM: \(error)")
    }
    
    func requestCompleted() {
        view?.reloadData()
    }
    
    
}
