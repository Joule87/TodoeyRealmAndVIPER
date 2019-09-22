//
//  ItemInteractor.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/21/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import Foundation
import RealmSwift

class ItemInteractor {
    let service = RealmMananger.shared
    weak var presenter: ItemInteractorPresenterDelegate?
}
extension ItemInteractor: ItemPresenterInteractorDelegate {
    func update(item: Item) {
        service.update {
            item.done = !item.done
        }
        presenter?.requestCompleted()
    }
    
    func saveItem(_ parentCategory: Category, _ item: Item) {
        service.update {
            parentCategory.items.append(item)
        }
        presenter?.requestCompleted()
        
    }
    
    func delete(item: Item) {
        //Delete Item
    }
    
    
}
