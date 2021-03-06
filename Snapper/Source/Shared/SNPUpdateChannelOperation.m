//
//  SNPUpdateChannelOperation.m
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPUpdateChannelOperation.h"

#import "SNPChannel.h"

#import "SNPAPIUtils.h"


@implementation SNPUpdateChannelOperation

#pragma mark - Initialization

- (instancetype)initWithChannelId:(NSUInteger)channelId
              accountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse*))finishBlock {

    self = [super initWithAccountId:accountId
                        finishBlock:finishBlock];
    if(self) {
        self.channelId = channelId;
        self.method = @"POST";
    }

    return self;
}


#pragma mark - Workhorse

- (void)main {

    self.endpoint = [[SNPAPIUtils sharedInstance] updateChannelEndpointURL:_channelId];

    SNPChannel* channel = [SNPChannel new];

    channel.annotations = _annotations;
    channel.readers = _readers;
    channel.writers = _writers;

    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:channel];
    NSDictionary* channelDict = [adapter JSONDictionary];
    NSError* error = nil;
    NSData* bodyData = [NSJSONSerialization dataWithJSONObject:channelDict
                                                       options:0
                                                         error:&error];
    if(bodyData == nil) {
        SNPResponse* response = [self createResponseFromError:error];
        self.finishBlock(response);
        return;
    }

    self.body = bodyData;
    self.bodyType = @"application/json";

    self.serializationRootClass = [SNPChannel class];

    [super main];
}

@end
