//
//  SNUnstarPostOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNUnstarPostOperation.h"

#import "SNAPIUtils.h"


@implementation SNUnstarPostOperation

#pragma mark - Initialization

- (id)initWithPostId:(NSUInteger)postId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNResponse*))finishBlock {

    self = [super init];
    if(self) {
        self.postId = postId;
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNAPIUtils sharedAPIUtils] unstarPostEndpointURL:_postId];
    self.method = @"DELETE";

    [super main];
}

@end