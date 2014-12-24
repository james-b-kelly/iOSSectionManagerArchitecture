//
//  APIClient.h
//  ArchitectureTemplate
//
//  Created by Kelly, James | Jamie | SDTD on 12/24/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompletionBlockWithArray)(NSError *error, NSArray *array);

@interface APIClient : NSObject

- (void)fetchPrimaryItemsFromAPIWithCompletion:(CompletionBlockWithArray)completion;

- (void)fetchSecondaryItemsFromAPIWithCompletion:(CompletionBlockWithArray)completion;

@end
