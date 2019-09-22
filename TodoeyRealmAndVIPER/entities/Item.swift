//
//  Item.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/19/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var createdDate = Date()
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")

}
