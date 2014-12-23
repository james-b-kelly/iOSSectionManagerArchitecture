//
//  SectionManagerBase.h
//  ArchitectureTemplate
//
//  Created by Jamie on 23/12/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewModelBase.h"

@interface SectionManagerBase : NSObject

@property (nonatomic, strong) ViewModelBase *viewModel;
@property (nonatomic, strong) UICollectionView *collectionView;

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView viewModel:(ViewModelBase *)viewModel;

- (NSInteger)numberOfItems;

- (CGSize)sizeForItemAtIndex:(NSInteger)index;

- (UICollectionViewCell *)cellForIndex:(NSInteger)index;


@end
