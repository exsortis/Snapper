//
//  SNPGetFileOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPGetFileOperation.h"

#import "SNPFile.h"

#import "SNPAPIUtils.h"


@implementation SNPGetFileOperation

#pragma mark - Initializers

- (instancetype)initWithFileId:(NSUInteger)fileId
           fileToken:(NSString*)fileToken
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.fileId = fileId;
        self.fileToken = fileToken;
        self.method = @"GET";
        self.serializationRootClass = [SNPFile class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] getFileEndpointURL:_fileId];

    [super main];
}

@end
