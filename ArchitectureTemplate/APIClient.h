//
//  APIClient.h
//  ArchitectureTemplate
//
//  Created by Kelly, James | Jamie | SDTD on 12/24/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  This is an example of an API handling class.  Typically this would fetch items from an API
 *  (using some kind of network stack like AFNetworking) and parse the results into objects which
 *  can be consumed by other classes in the app.
 *
 *  You would ideally have an APIClient for each API you call (or logical set of APIs for a given feature).
 */


typedef void (^CompletionBlockWithArray)(NSError *error, NSArray *array);

@interface APIClient : NSObject

/**
 *  Examples of methods to fetch two different types of objects from an API.
 */
- (void)fetchPrimaryItemsFromAPIWithCompletion:(CompletionBlockWithArray)completion;

- (void)fetchSecondaryItemsFromAPIWithCompletion:(CompletionBlockWithArray)completion;

@end
