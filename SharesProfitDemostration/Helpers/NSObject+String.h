//
//  NSObject+String.h
//  SharesProfitDemostration
//
//  Created by  Macbook on 30.09.2020.
//  Copyright © 2020 Golovelv Maxim. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Date)
- (NSDate*)toDate:(NSString*)withFormat;
@end

NS_ASSUME_NONNULL_END
