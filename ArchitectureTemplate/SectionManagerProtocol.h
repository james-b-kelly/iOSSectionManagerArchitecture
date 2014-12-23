//
//  SectionManagerProtocol.h
//  ArchitectureTemplate
//
//  Created by Jamie on 23/12/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewModelProtocol.h"

@protocol SectionManagerProtocol <NSObject>

@property (nonatomic, strong) id<ViewModelProtocol>viewModel;
@property (nonatomic, strong) UICollectionView *collectionView;

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView viewModel:(id<ViewModelProtocol>)viewModel;

- (NSInteger)numberOfItems;

- (CGSize)sizeForItemAtIndex:(NSInteger)index;

- (UICollectionViewCell *)cellForIndex:(NSInteger)index;

@end
