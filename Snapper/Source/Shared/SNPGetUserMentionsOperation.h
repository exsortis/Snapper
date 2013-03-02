//
//  SNPGetUserMentionsOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseStreamOperation.h"


@interface SNPGetUserMentionsOperation : SNPBaseStreamOperation

// -- Properties --
@property (nonatomic, assign) NSUInteger userId;

// -- Initialization --
- (id)initWithUserId:(NSUInteger)userId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
