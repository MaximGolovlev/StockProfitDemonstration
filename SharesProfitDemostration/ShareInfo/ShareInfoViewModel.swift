//
//  ShareInfoViewModel.swift
//  SharesProfitDemostration
//
//  Created by  Macbook on 29.09.2020.
//  Copyright © 2020 Golovelv Maxim. All rights reserved.
//

import Foundation
import Combine

class ShareInfoViewModel: ObservableObject {
    
    let shareService = ShareService()
    
    @Published var shares: [Share] = []
    @Published var deals: [Deal] = []
    
    var cancellable: AnyCancellable?

    func fetchShares() {
        cancellable = shareService.fetchShares().sink(receiveCompletion: { (completion) in
            if case .failure(let error) = completion {
                print(error.localizedDescription)
            }
        }, receiveValue: { (shares) in
            self.shares = shares
        })
    }
    
    func getMaxProfit() {
        getMaxProfit(stocks: shares)
    }
    
    private func getMaxProfit(stocks: [Share]) {
          
        deals.removeAll()
        
        guard stocks.count > 2 else {
            print("Profit calculation requires at least two prices in the array")
            return
        }
        
        var i = 0
        while i < (stocks.count - 1) {
            
            // find local min
            while i < (stocks.count - 1) && (stocks[i + 1].value <= stocks[i].value) {
                i += 1
            }
            
            if i == stocks.count - 1 {
                break
            }
            
            var deal = Deal()
            deal.buy = stocks[i]
            i += 1
            
            // find local max
            while (i < stocks.count) && (stocks[i].value >= stocks[i - 1].value) {
                i += 1
            }
            
            deal.sell = stocks[i - 1]
            
            deals.append(deal)
        }
    }
    
}
