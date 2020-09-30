//
//  NSObject+String.m
//  SharesProfitDemostration
//
//  Created by  Macbook on 30.09.2020.
//  Copyright © 2020 Golovelv Maxim. All rights reserved.
//

#import "NSObject+String.h"


@implementation NSString (Date)

- (NSDate*)toDate:(NSString*)withFormat {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: withFormat];
    return [dateFormatter dateFromString: self];
}

@end

