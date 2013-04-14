//
//  SNPGetMyFilesOperation.h
//  Snapper
//
//  Created by Paul Schifferer on 1/29/13.
//  Copyright (c) 2013 Pilgrimage Software. All rights reserved.
//

#import "SNPBaseUserTokenOperation.h"


@interface SNPGetMyFilesOperation : SNPBaseUserTokenOperation

// -- Properties --

// -- Initializers --
- (id)initWithAccountId:(NSString*)accountId
            finishBlock:(void (^)(SNPResponse* response))finishBlock;

@end
