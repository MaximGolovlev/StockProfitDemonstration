//
//  Profit.swift
//  SharesProfitDemostration
//
//  Created by  Macbook on 30.09.2020.
//  Copyright © 2020 Golovelv Maxim. All rights reserved.
//

import Foundation

class Deal {
    var buy: Share?
    var sell: Share?
    
    var isValid: Bool {
        return sell != nil && buy != nil
    }
    
    var profit: Int? {
        guard let sell = sell, let buy = buy else { return nil }
        return sell.value - buy.value
    }
}
