//
//  DetailViewModel.m
//  ArchitectureTemplate
//
//  Created by Kelly, James | Jamie | SDTD on 12/24/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import "DetailViewModel.h"
#import "Item.h"

@interface DetailViewModel()
@property (nonatomic, strong) Item *item;

/**
 *  Saving/editing is not supported in the UI for this example, but it is easy to implement by
 *  using our exposed properties to hold the item's data in its current state
 *  as the user edits it.  When the user chooses to save, we copy those values onto the actual item.
 *  If the used cancels, we just reset the values to those on the item.
 */
@property (readwrite) NSString *itemTitle;
@property (readwrite) NSString *itemDescription;

@end

@implementation DetailViewModel

- (instancetype)initWithItem:(Item *)item {
    if (self = [super init]) {
        _item = item;
    }
    return self;
}

- (void)loadData {
    [self refreshEditingData];
}

- (NSString *)itemName {
    return self.itemTitle;
}

- (NSString *)itemDescription {
    return self.itemDescription;
}


#pragma mark - Methods for saving/undoing.

- (void)refreshEditingData {
    self.itemTitle = self.item.itemTitle;
    self.itemDescription = self.item.itemDescription;
}

- (void)save {
    self.item.itemTitle = self.itemTitle;
    self.item.itemDescription = self.itemDescription;
}

- (void)undo {
    [self refreshEditingData];
}


@end
