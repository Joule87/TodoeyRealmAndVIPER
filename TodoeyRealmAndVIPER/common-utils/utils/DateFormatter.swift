//
//  DateFormatter.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/20/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import Foundation

class DateFormatterUtil {
    
    static func getFomattedDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: date)
    }
    
    
}
