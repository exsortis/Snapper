//
//  SNPGetRepostersOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseStreamOperation.h"


@interface SNPGetRepostersOperation : SNPBaseStreamOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger postId;

// -- Initialization --
- (id)initWithPostId:(NSUInteger)postId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
