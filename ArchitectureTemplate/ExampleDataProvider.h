//
//  ExampleDataProvider.h
//  ArchitectureTemplate
//
//  Created by Kelly, James | Jamie | SDTD on 12/24/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  This is an example of a 'data provider' class.  Call it what you like - "DataController" or whatever.
 *  Its responsibility is to pull data in from various sources like API client classes, CoreData 
 *  (via CoreDataManager or some other class which manages CoreData).
 *  Each data provider ideally provide access to some logical collection of data, 
 *  so you might have a "PurchaseHistoryDataController", or a "FavouriteItemsDataController".
 */

typedef void (^DataProviderCompletionBlock)(NSError *error);

@interface ExampleDataProvider : NSObject


/**
 *  This class is a singleton.
 *  We don't want multiple parts of the app creating many instances of data providers
 *  which might call API's/data sources at the same time.  Having our data providers as singletons
 *  means we have a reliable store of data with a predictable state.
 */
+ (void)refreshDataWithCompletion:(DataProviderCompletionBlock)completion;

+ (NSArray *)primaryItems;

+ (NSArray *)secondaryItems;

@end
