//
//  SNPHashtag.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPHashtag.h"


@implementation SNPHashtag

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            @"position": @"pos",
            @"length": @"len",
            };
}

@end
