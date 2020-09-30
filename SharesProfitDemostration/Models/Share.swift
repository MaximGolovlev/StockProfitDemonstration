//
//  Share.swift
//  SharesProfitDemostration
//
//  Created by  Macbook on 29.09.2020.
//  Copyright © 2020 Golovelv Maxim. All rights reserved.
//

import Foundation

class Share: Codable, Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.value)
        hasher.combine(self.date)
    }
    
    static func == (lhs: Share, rhs: Share) -> Bool {
        return lhs.value == rhs.value && lhs.date == rhs.date
    }
    
    var value: Int
    var date: Date
    
    init(value: Int, date: Date) {
        self.value = value
        self.date = date
    }

}
