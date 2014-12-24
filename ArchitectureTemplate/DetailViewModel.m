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
@end

@implementation DetailViewModel

- (instancetype)initWithItem:(Item *)item {
    if (self = [super init]) {
        self.item = item;
    }
    return self;
}

- (void)loadData {
    
}

- (NSString *)itemName {
    return self.item.itemTitle;
}

- (NSString *)itemDescription {
    return self.item.itemDescription;
}

@end
