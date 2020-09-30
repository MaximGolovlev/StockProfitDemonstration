//
//  ShareService.swift
//  SharesProfitDemostration
//
//  Created by  Macbook on 29.09.2020.
//  Copyright © 2020 Golovelv Maxim. All rights reserved.
//

import Foundation
import Combine

class ShareService {
    
    static var defaultShares = [
        Share(value: 4, date: "01.02.2020".toDate("dd.MM.yyyy")),
        Share(value: 3, date: "02.02.2020".toDate("dd.MM.yyyy")),
        Share(value: 4, date: "03.02.2020".toDate("dd.MM.yyyy")),
        Share(value: 4, date: "04.02.2020".toDate("dd.MM.yyyy")),
        Share(value: 3, date: "05.02.2020".toDate("dd.MM.yyyy")),
        Share(value: 5, date: "06.02.2020".toDate("dd.MM.yyyy")),
        Share(value: 6, date: "07.02.2020".toDate("dd.MM.yyyy")),
        Share(value: 4, date: "08.02.2020".toDate("dd.MM.yyyy")),
        Share(value: 3, date: "09.02.2020".toDate("dd.MM.yyyy")),
        Share(value: 4, date: "10.02.2020".toDate("dd.MM.yyyy")),
        Share(value: 4, date: "11.02.2020".toDate("dd.MM.yyyy")),
        Share(value: 6, date: "12.02.2020".toDate("dd.MM.yyyy")),
        Share(value: 7, date: "13.02.2020".toDate("dd.MM.yyyy")),
        Share(value: 7, date: "14.02.2020".toDate("dd.MM.yyyy"))]

    func fetchShares() -> PassthroughSubject<[Share], Error> {
        
        let publisher = PassthroughSubject<[Share], Error>()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            publisher.send(ShareService.defaultShares)
        })
        
        return publisher
    }
    
}
