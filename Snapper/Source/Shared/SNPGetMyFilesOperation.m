//
//  SNPGetMyFilesOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPGetMyFilesOperation.h"

#import "SNPFile.h"

#import "SNPAPIUtils.h"


@implementation SNPGetMyFilesOperation

#pragma mark - Initializers

- (id)initWithAccountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock {

    self = [super init];
    if(self) {
        self.accountId = accountId;
        self.finishBlock = finishBlock;
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedAPIUtils] getMyFilesEndpointURL];
    self.method = @"GET";
    self.serializationArrayClass = [SNPFile class];

    [super main];
}

@end
