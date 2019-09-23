//
//  CategoryInteractor.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/19/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryInteractor {
    weak var presenter: CategoryInteractorPresenterDelegate?
    let service = RealmMananger.shared
}

extension CategoryInteractor: CategoryPresenterInteractorDelegate {
    func delete(category: Category) {
        //TODO:- Delete category
    }
    
    func saveCategory(category: Category) {
        do {
            try service.save(object: category)
            presenter?.requestCompleted()
        } catch {
            presenter?.requestFailed(error: error as! RealmError)
        }
       
    }
    
    func fetchCategoryList() {
        let categoryResult = service.get(objectsType: Category.self)
        presenter?.categoryFetched(categoryResult)
    }
    
}
