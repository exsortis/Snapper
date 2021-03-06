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

- (instancetype)initWithAccountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.endpoint = [[SNPAPIUtils sharedInstance] getMyFilesEndpointURL];
        self.method = @"GET";
        self.serializationArrayClass = [SNPFile class];
    }

    return self;
}

@end
