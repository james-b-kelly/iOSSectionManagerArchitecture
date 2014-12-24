//
//  ExampleDataProvider.h
//  ArchitectureTemplate
//
//  Created by Kelly, James | Jamie | SDTD on 12/24/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^DataProviderCompletionBlock)(NSError *error);

@interface ExampleDataProvider : NSObject

+ (void)refreshDataWithCompletion:(DataProviderCompletionBlock)completion;

+ (NSArray *)primaryItems;

+ (NSArray *)secondaryItems;

@end
