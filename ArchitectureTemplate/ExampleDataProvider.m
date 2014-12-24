//
//  ExampleDataProvider.m
//  ArchitectureTemplate
//
//  Created by Kelly, James | Jamie | SDTD on 12/24/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import "ExampleDataProvider.h"
#import "APIClient.h"

@interface ExampleDataProvider()
@property (nonatomic, strong) APIClient *apiClient;
@property (nonatomic, strong) NSArray *primaryItems;
@property (nonatomic, strong) NSArray *secondaryItems;
@end

@implementation ExampleDataProvider

+ (instancetype)sharedInstance {
    static ExampleDataProvider *dataProvider;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataProvider = [[ExampleDataProvider alloc] init];
        dataProvider.apiClient = [[APIClient alloc] init];
    });
    return dataProvider;
}

+ (void)refreshDataWithCompletion:(DataProviderCompletionBlock)completion {
    ExampleDataProvider *dataProvider = [ExampleDataProvider sharedInstance];
    __weak ExampleDataProvider *weakDataProvider = dataProvider;
    
    __block BOOL primaryFetched = NO;
    __block BOOL secondaryFetched = NO;
    [dataProvider.apiClient fetchPrimaryItemsFromAPIWithCompletion:^(NSError *error, NSArray *array) {
        primaryFetched = YES;
        ExampleDataProvider *strongDataProvider = weakDataProvider;
        if (strongDataProvider) {
            if (!error) {
                strongDataProvider.primaryItems = [NSArray arrayWithArray:array];
            }
            if (secondaryFetched) {
                if (completion) {
                    completion(error);
                }
            }
        }
    }];
    [dataProvider.apiClient fetchSecondaryItemsFromAPIWithCompletion:^(NSError *error, NSArray *array) {
        secondaryFetched = YES;
        ExampleDataProvider *strongDataProvider = weakDataProvider;
        if (strongDataProvider) {
            if (!error) {
                strongDataProvider.secondaryItems = [NSArray arrayWithArray:array];
            }
            if (primaryFetched) {
                if (completion) {
                    completion(error);
                }
            }
        }
    }];
}

+ (NSArray *)primaryItems {
    return [ExampleDataProvider sharedInstance].primaryItems;
}

+ (NSArray *)secondaryItems {
    return [ExampleDataProvider sharedInstance].secondaryItems;
}

@end
