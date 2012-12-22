//
//  SNAnnotation.h
//  Snapper
//
//  Created by Paul Schifferer on 12/18/12.
//  Copyright (c) 2012 Pilgrimage Software. All rights reserved.
//

#import <Mantle/Mantle.h>


#define SN_ANNOTATION_TYPE_CORE_CROSSPOST (@"net.app.core.crosspost")
#define SN_ANNOTATION_TYPE_CORE_OEMBED (@"net.app.core.oembed")
#define SN_ANNOTATION_TYPE_CORE_GEOLOCATION (@"net.app.core.geolocation")
#define SN_ANNOTATION_TYPE_CORE_LANGUAGE (@"net.app.core.language")
#define SN_ANNOTATION_TYPE_CORE_BLOG (@"net.app.core.directory.blog")
#define SN_ANNOTATION_TYPE_CORE_FACEBOOK (@"net.app.core.directory.facebook")
#define SN_ANNOTATION_TYPE_CORE_TWITTER (@"net.app.core.directory.twitter")
#define SN_ANNOTATION_TYPE_CORE_HOMEPAGE (@"net.app.core.directory.homepage")

/**
 * Represents an annotation.
 *
 * Note that because of the open nature of annotations, the 'value' property is
 * simply a dictionary.
 */
@interface SNAnnotation : MTLModel

@property (nonatomic, copy) NSString* type;
@property (nonatomic, retain) NSDictionary* value;

@end