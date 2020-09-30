//
//  Collection+Ext.swift
//  SharesProfitDemostration
//
//  Created by  Macbook on 30.09.2020.
//  Copyright © 2020 Golovelv Maxim. All rights reserved.
//

import Foundation

extension Array where Element == Deal {
    
    var description: String {
        
        let validValues = self.filter({ $0.isValid })
        
        if validValues.isEmpty {
            return "Can not make profit out of it"
        }
        
        let array = validValues.reduce(into: [String]()) { (res, deal) in
            res.append("Buy on day: \(deal.buy!.date.get(.day)) -> Sell on day: \(deal.sell!.date.get(.day)) = Profit: \(deal.profit!)$")
        }
        
        return array.joined(separator: ",\n")
        
    }
    
    var totalProfit:  String {
        
        let profit = self.filter({ $0.isValid }).map({ $0.profit! }).reduce(0, +)
        return "Total Profit: \(profit)$"
    }
    
}
