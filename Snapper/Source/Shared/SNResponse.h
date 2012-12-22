//
//  SNResponse.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SNMetadata.h"


@interface SNResponse : NSObject

@property (nonatomic, retain) id data;
@property (nonatomic, retain) SNMetadata* metadata;

@end