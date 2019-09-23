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
    private var searchPredicate: NSPredicate?
    private var debounce_timer: Timer?
    private var itemList: Results<Item>?
}

extension ItemPresenter: ItemViewPresenterDelegate {
    func notifyViewDidLoad() {
        view?.setupUIViewElements()
    }
    
    func notifyViewWillAppear() {
        
    }
    
    func didSelectItem(_ indexPath: IndexPath) {
        guard let items = itemList else {
            return
        }
        interactor?.update(item: items[indexPath.row])
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
        if let predicate = searchPredicate {
            itemList = category.items.filter(predicate).sorted(byKeyPath: "title", ascending: true)
        } else {
            itemList = category.items.sorted(byKeyPath: "title", ascending: true)
        }
        return itemList
    }
    
    func searchItems(for title: String) {
        debounceSearch {
            if title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                self.searchPredicate = nil
            } else {
                self.searchPredicate = NSPredicate(format: "title CONTAINS[cd] %@", title)
            }
            self.view?.reloadData()
        }

    }
    
    func debounceSearch(action: @escaping ()->()) {
        debounce_timer?.invalidate()
        debounce_timer = Timer.scheduledTimer(withTimeInterval: 0.50, repeats: false, block: { _ in
            action()
        })
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
