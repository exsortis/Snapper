//
//  SNPBaseImageUpdateOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 1/13/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNPBaseUserTokenOperation.h"


@interface SNPBaseImageUpdateOperation : SNPBaseUserTokenOperation

// -- Properties --
@property (nonatomic, retain) id image;

// -- Initializers --
- (id)initWithImage:(id)image
          accountId:(NSString*)accountId
        finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
