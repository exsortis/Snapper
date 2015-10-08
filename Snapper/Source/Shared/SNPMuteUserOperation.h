//
//  SNPMuteUserOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"
#import "SNPUserParameters.h"


@interface SNPMuteUserOperation : SNPBaseUserTokenOperation
<SNPUserParameters>

// -- Properties --
@property (nonatomic, assign) NSUInteger userId;

// -- Initialization --
- (instancetype)initWithUserId:(NSUInteger)userId
           accountId:(nonnull NSString*)accountId
         finishBlock:(nonnull void (^)(SNPResponse* _Nonnull response))finishBlock;

@end
