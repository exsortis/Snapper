//
//  SNPInteraction.h
//  Snapper
//
//  Created by Paul Schifferer on 12/20/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


typedef NS_ENUM(NSInteger, SNPInteractionAction) {
    SNPInteractionActionFollow,
    SNPInteractionActionReply,
    SNPInteractionActionRepost,
    SNPInteractionActionStar,
    SNPInteractionActionWelcome,
    SNPInteractionActionBroadcastCreate,
    SNPInteractionActionBroadcastSubscribe,
    SNPInteractionActionBroadcastUnsubscribe,
};

@interface SNPInteraction : MTLModel
<MTLJSONSerializing>

@property (nonatomic, assign) SNPInteractionAction action;
@property (nonatomic, nonnull, copy) NSArray* objects;
@property (nonatomic, nonnull, copy) NSArray* users;
@property (nonatomic, nonnull, copy) NSDate* eventDate;
@property (nonatomic, assign) NSInteger paginationId;

@end
