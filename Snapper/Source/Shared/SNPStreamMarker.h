//
//  SNPStreamMarker.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface SNPStreamMarker : MTLModel
<MTLJSONSerializing>

@property (nonatomic, assign) NSUInteger postId;
@property (nonatomic, nonnull, copy) NSString* name;
@property (nonatomic, assign) NSInteger percentage;
@property (nonatomic, nonnull, copy) NSDate* updatedAt;
@property (nonatomic, nonnull, copy) NSString* version;

@end
