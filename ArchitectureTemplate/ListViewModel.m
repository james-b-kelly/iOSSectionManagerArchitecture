//
//  ListViewModel.m
//  ArchitectureTemplate
//
//  Created by Jamie on 23/12/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import "ListViewModel.h"
#import "ExampleDataProvider.h"
#import "Item.h"

@interface ListViewModel()
@property (nonatomic, strong) NSArray *primaryItems;
@property (nonatomic, strong) NSArray *secondaryItems;
@end

@implementation ListViewModel

- (void)loadData {
    [ExampleDataProvider refreshDataWithCompletion:^(NSError *error) {
        self.primaryItems = [NSArray arrayWithArray:[ExampleDataProvider primaryItems]];
        self.secondaryItems = [NSArray arrayWithArray:[ExampleDataProvider secondaryItems]];
        [self notifyDelegateViewModelDidUpdate];
    }];
}

- (NSInteger)numberOfPrimaryItems {
    return self.primaryItems.count;
}

- (NSString *)titleForPrimaryItemAtIndex:(NSInteger)index {
    if (index < self.primaryItems.count) {
        Item *item = self.primaryItems[index];
        return item.itemTitle;
    }
    return nil;
}

- (NSInteger)numberOfSecondaryItems {
    return self.secondaryItems.count;
}

- (NSString *)titleForSecondaryItemAtIndex:(NSInteger)index {
    if (index < self.secondaryItems.count) {
        Item *item = self.secondaryItems[index];
        return item.itemDescription;
    }
    return nil;
}


- (id)primaryItemAtIndex:(NSInteger)index {
    if (index < self.primaryItems.count) {
        return self.primaryItems[index];
    }
    return nil;
}

- (id)secondaryItemAtIndex:(NSInteger)index {
    if (index < self.secondaryItems.count) {
        return self.secondaryItems[index];
    }
    return nil;
}

@end
