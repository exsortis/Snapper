//
//  SNPDeleteFileOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserOperation.h"


@interface SNPDeleteFileOperation : SNPBaseUserOperation

// -- Properties --
@property (nonatomic, assign) NSInteger fileId;

// -- Initializers --
- (id)initWithFileId:(NSInteger)fileId
           accountId:(NSString*)accountId
         finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end