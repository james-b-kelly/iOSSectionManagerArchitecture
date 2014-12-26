//
//  APIClient.m
//  ArchitectureTemplate
//
//  Created by Kelly, James | Jamie | SDTD on 12/24/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import "APIClient.h"
#import "Item.h"

@implementation APIClient

/**
 *  These methods just create some Item objects as if they were returned from an API.
 *  In a real-world scenario these items would be parsed from a JSON/XML response from an API.
 *
 *  In this example the 'data provider' classes retrieve data from the 'API client' classes in the form
 *  of 'Item' objects.  You will most likely be using some form of persistence like Coredata.
 *  in that case, it is up to you whether you want your API client classes interacting with Coredata,
 *  or you want to pass you data from API clients to data providers as NSDictionary objects and do the 
 *  Coredata importing in your data providers.
 */

- (void)fetchPrimaryItemsFromAPIWithCompletion:(CompletionBlockWithArray)completion {
    NSMutableArray *objects = [NSMutableArray array];
    for (NSInteger i = 0; i < 4; i++) {
        Item *item = [[Item alloc] init];
        item.itemTitle = [NSString stringWithFormat:@"Primary item %ld", i];
        item.itemDescription = [NSString stringWithFormat:@"Primary Item Description %ld", i];
        [objects addObject:item];
    }
    if (completion) {
        completion(nil, [NSArray arrayWithArray:objects]);
    }
}

- (void)fetchSecondaryItemsFromAPIWithCompletion:(CompletionBlockWithArray)completion {
    NSMutableArray *objects = [NSMutableArray array];
    for (NSInteger i = 0; i < 3; i++) {
        Item *item = [[Item alloc] init];
        item.itemTitle = [NSString stringWithFormat:@"Secondary item %ld", i];
        item.itemDescription = [NSString stringWithFormat:@"Secondary Item Description %ld", i];
        [objects addObject:item];
    }
    if (completion) {
        completion(nil, [NSArray arrayWithArray:objects]);
    }
}

@end
