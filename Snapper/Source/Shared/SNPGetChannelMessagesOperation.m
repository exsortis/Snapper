//
//  SNPGetChannelMessagesOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPGetChannelMessagesOperation.h"

#import "SNPMessage.h"

#import "SNPAPIUtils.h"


@implementation SNPGetChannelMessagesOperation

#pragma mark - Initialization

- (instancetype)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.channelId = channelId;
        self.serializationArrayClass = [SNPMessage class];
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] getChannelMessagesEndpointURL:_channelId];

    [super main];
}

@end
