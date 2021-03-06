//
//  SNPMessage.m
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import "SNPMessage.h"

#import "SNPHashtag.h"
#import "SNPMention.h"
#import "SNPLink.h"
#import "SNPAnnotation.h"


@implementation SNPMessage

+ (NSDateFormatter *)dateFormatter {
    static NSDateFormatter* dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        dateFormatter.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'";
        dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    });

    return dateFormatter;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"messageId": @"id",
             @"channelId": @"channel_id",
             @"createdAt": @"created_at",
             @"sourceName": @"source.name",
             @"sourceLink": @"source.link",
             @"sourceClientId": @"source.client_id",
             @"machineOnly": @"machine_only",
             @"threadId": @"thread_id",
             @"numReplies": @"num_replies",
             @"mentions": @"entities.mentions",
             @"hashtags": @"entities.hashtags",
             @"links": @"entities.links",
             @"deleted": @"is_deleted",
             };
}

+ (NSValueTransformer*)channelIdJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *strId) {
                NSNumberFormatter* formatter = [NSNumberFormatter new];
                return @([[formatter numberFromString:strId] longLongValue]);
            }
                                                         reverseBlock:
            ^(NSNumber* intNum) {
                return [NSString stringWithFormat:@"%lld", [intNum longLongValue]];
            }];
}

+ (NSValueTransformer*)messageIdJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *strId) {
                NSNumberFormatter* formatter = [NSNumberFormatter new];
                return @([[formatter numberFromString:strId] longLongValue]);
            }
                                                         reverseBlock:
            ^(NSNumber* intNum) {
                return [NSString stringWithFormat:@"%lld", [intNum longLongValue]];
            }];
}

+ (NSValueTransformer*)threadIdJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *strId) {
                NSNumberFormatter* formatter = [NSNumberFormatter new];
                return @([[formatter numberFromString:strId] longLongValue]);
            }
                                                         reverseBlock:
            ^(NSNumber* intNum) {
                return [NSString stringWithFormat:@"%lld", [intNum longLongValue]];
            }];
}

+ (NSValueTransformer*)createdAtJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^(NSString *str) {
                return [self.dateFormatter dateFromString:str];
            }
                                                         reverseBlock:
            ^(NSDate *date) {
                return [self.dateFormatter stringFromDate:date];
            }];
}

+ (NSValueTransformer*)userJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSDictionary* dict) {
                NSError* error = nil;
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:dict
                                                                              modelClass:[SNPUser class]
                                                                                   error:&error];
                if(adapter == nil) {
                    NSLog(@"Unable to deserialize user: %@", error);
                    return nil;
                }
                else {
                    return [adapter model];
                }
            }
                                                         reverseBlock:
            ^id(SNPUser* user) {
                MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:user];
                return [adapter JSONDictionary];
            }];
}

+ (NSValueTransformer*)annotationsJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSArray* annotationDicts) {
                NSMutableArray* annotations = [NSMutableArray new];

                for(NSDictionary* annoDict in annotationDicts) {
                    NSError* error = nil;
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:annoDict
                                                                                  modelClass:[SNPAnnotation class]
                                                                                       error:&error];
                    if(adapter == nil) {
                        NSLog(@"Unable to deserialize mention: %@", error);
                    }
                    else {
                        SNPAnnotation* annotation = (SNPAnnotation*)[adapter model];

                        [annotations addObject:annotation];
                    }
                }

                return [annotations copy];
            }
                                                         reverseBlock:
            ^id(NSArray* annotations) {
                NSMutableArray* annoDicts = [NSMutableArray new];

                for(SNPAnnotation* annotation in annotations) {
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:annotation];
                    NSDictionary* annoDict = [adapter JSONDictionary];

                    [annoDicts addObject:annoDict];
                }

                return [annoDicts copy];
            }];
}


+ (NSValueTransformer*)mentionsJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSArray* mentionsDicts) {
                NSMutableArray* mentions = [NSMutableArray new];

                for(NSDictionary* mentionDict in mentionsDicts) {
                    NSError* error = nil;
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:mentionDict
                                                                                  modelClass:[SNPMention class]
                                                                                       error:&error];
                    if(adapter == nil) {
                        NSLog(@"Unable to deserialize mention: %@", error);
                    }
                    else {
                        SNPMention* mention = (SNPMention*)[adapter model];

                        [mentions addObject:mention];
                    }
                }

                return [mentions copy];
            }
                                                         reverseBlock:
            ^id(NSArray* mentions) {
                NSMutableArray* mentionsDicts = [NSMutableArray new];

                for(SNPMention* mention in mentions) {
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:mention];
                    NSDictionary* mentionDict = [adapter JSONDictionary];

                    [mentionsDicts addObject:mentionDict];
                }

                return [mentionsDicts copy];
            }];
}

+ (NSValueTransformer*)linksJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSArray* linksDicts) {
                NSMutableArray* links = [NSMutableArray new];

                for(NSDictionary* linkDict in linksDicts) {
                    NSError* error = nil;
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:linkDict
                                                                                  modelClass:[SNPLink class]
                                                                                       error:&error];
                    if(adapter == nil) {
                        NSLog(@"Unable to deserialize mention: %@", error);
                    }
                    else {
                        SNPLink* link = (SNPLink*)[adapter model];

                        [links addObject:link];
                    }
                }

                return [links copy];
            }
                                                         reverseBlock:
            ^id(NSArray* links) {
                NSMutableArray* linksDicts = [NSMutableArray new];

                for(SNPLink* link in links) {
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:link];
                    NSDictionary* linkDict = [adapter JSONDictionary];

                    [linksDicts addObject:linkDict];
                }

                return [linksDicts copy];
            }];
}

+ (NSValueTransformer*)hashtagsJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:
            ^id(NSArray* hashtagsDicts) {
                NSMutableArray* hashtags = [NSMutableArray new];

                for(NSDictionary* hashtagDict in hashtagsDicts) {
                    NSError* error = nil;
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithJSONDictionary:hashtagDict
                                                                                  modelClass:[SNPHashtag class]
                                                                                       error:&error];
                    if(adapter == nil) {
                        NSLog(@"Unable to deserialize mention: %@", error);
                    }
                    else {
                        SNPHashtag* hashtag = (SNPHashtag*)[adapter model];

                        [hashtags addObject:hashtag];
                    }
                }

                return [hashtags copy];
            }
                                                         reverseBlock:
            ^id(NSArray* hashtags) {
                NSMutableArray* hashtagsDicts = [NSMutableArray new];

                for(SNPHashtag* hashtag in hashtags) {
                    MTLJSONAdapter* adapter = [[MTLJSONAdapter alloc] initWithModel:hashtag];
                    NSDictionary* hashtagDict = [adapter JSONDictionary];
                    
                    [hashtagsDicts addObject:hashtagDict];
                }
                
                return [hashtagsDicts copy];
            }];
}

@end
