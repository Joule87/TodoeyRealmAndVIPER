//
//  ItemPresenterDelegates.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/21/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import Foundation
import RealmSwift

//MARK:- ItemView -> ItemPresenter
protocol ItemViewPresenterDelegate {
    var selectedCategory: Category? { get set }
    func notifyViewDidLoad()
    func notifyViewWillAppear()
    func didSelectItem(_ indexPath: IndexPath)
    func addNewItem(name: String, done: Bool)
    func getItemList() -> Results<Item>?
    func searchItems(for title: String)
    func deleteItem(at indexPath: IndexPath)
}

//MARK:- ItemInteractor -> ItemPresenter
protocol ItemInteractorPresenterDelegate: AnyObject {
    func requestCompleted()
    func requestFailed(error: RealmError)
}
