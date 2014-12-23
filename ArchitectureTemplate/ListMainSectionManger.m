//
//  ListMainSectionManger.m
//  ArchitectureTemplate
//
//  Created by Jamie on 23/12/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import "ListMainSectionManger.h"

@implementation ListMainSectionManger
@synthesize collectionView = _collectionView, viewModel = _viewModel;

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
                             viewModel:(id<ViewModelProtocol>)viewModel {
    if (self = [super init]) {
        _viewModel = viewModel;
        _collectionView = collectionView;
        
    }
    return self;
}

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(CGRectGetWidth(self.collectionView.frame), 44.0);
}

- (UICollectionViewCell *)cellForIndex:(NSInteger)index {
    return nil;
}

@end
