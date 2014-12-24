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

- (void)fetchPrimaryItemsFromAPIWithCompletion:(CompletionBlockWithArray)completion {
    //This is where you would call your API and parse out the values into NSDictionary objects.
    
    //We'll fake some objects here.
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
    //This is where you would call your API and parse out the values into NSDictionary objects.
    
    //We'll fake some objects here.
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
