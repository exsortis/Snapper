//
//  SNUnmuteUserOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNUnmuteUserOperation.h"

#import "SNAPIUtils.h"


@implementation SNUnmuteUserOperation

#pragma mark - Initialization

- (id)initWithUserId:(NSUInteger)userId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.userId = userId;
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNAPIUtils sharedAPIUtils] unmuteUserEndpointURL:_userId];
    self.method = @"DELETE";

    [super main];
}

@end