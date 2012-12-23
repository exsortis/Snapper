//
//  SNGetUsersOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNGetUsersOperation.h"

#import "SNUser.h"

#import "SNAPIUtils.h"


@implementation SNGetUsersOperation

- (id)initWithUserIds:(NSArray*)userIds
            accountId:(NSString*)accountId
          finishBlock:(void (^)(SNResponse *))finishBlock {

    self = [super init];
    if(self) {
        self.userIds = userIds;
        self.accountId = accountId;
    }

    return self;
}

- (void)main {

    self.endpoint = [[SNAPIUtils sharedAPIUtils] getUsersEndpointURL];

    NSString* userIdsString = [_userIds componentsJoinedByString:@","];
    self.parameters = (@{
                       @"ids" : userIdsString,
                       });

    self.serializationArrayClass = [SNUser class];

    [super main];
}

@end
