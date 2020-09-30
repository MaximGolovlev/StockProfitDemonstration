//
//  ShareInfoView.swift
//  SharesProfitDemostration
//
//  Created by  Macbook on 29.09.2020.
//  Copyright © 2020 Golovelv Maxim. All rights reserved.
//

import SwiftUI

struct ShareInfoView: View {
    
    @ObservedObject private var shareInfoModel = ShareInfoViewModel()
    
    var body: some View {
        
        ZStack (alignment: .top) {
            
            Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            VStack (alignment: .center, spacing: 16) {
                Text("Stock History")
                    .foregroundColor(Color(.white))
                    .font(.system(size: 32))
                    .fontWeight(.heavy)
                if !shareInfoModel.shares.isEmpty {

                    ScrollView (.horizontal) {
                        HStack {
                            ForEach(shareInfoModel.shares, id: \.self) { share in
                                BarView(value: share.value, date: share.date.get(.day))
                            }
                        }
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    
                    Button(action: {
                        self.shareInfoModel.getMaxProfit()
                    }, label: { Text("Calculate Best Profit").font(.callout) })
                }
                
                if !shareInfoModel.deals.isEmpty {
                    VStack (alignment: .trailing, spacing: 8) {
                        Text("\(shareInfoModel.deals.description)").lineLimit(100)
                        Text("\(shareInfoModel.deals.totalProfit)")
                    }
                    .font(.callout)
                    .foregroundColor(Color(.white))
                }

            }.padding(.top, 100)
            
        }
        .onAppear {
            self.shareInfoModel.fetchShares()
        }
    }
}


struct BarView: View {
    
    var value: Int
    var date: Int
    
    var body: some View {
        VStack {
            Text("\(value)$")
            ZStack (alignment: .bottom) {
                Capsule()
                    .frame(width: 20, height: 150)
                    .foregroundColor(Color(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)))
                Capsule()
                    .frame(width: 20, height: CGFloat(value)*150/7)
                    .foregroundColor(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
            }
            Text("\(date)")
        }
        .font(.callout)
        .foregroundColor(Color(.white))
        
    }
}

struct ShareInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ShareInfoView()
    }
}


