//
//  SNPGetBlockedUsersOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 6/8/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import <Snapper/Snapper.h>


@interface SNPGetBlockedUsersOperation : SNPBaseUserTokenOperation

// -- Properties --
@property (nonatomic, assign) NSInteger userId;

// -- Initialization --
- (id)initWithUserId:(NSUInteger)UserId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end