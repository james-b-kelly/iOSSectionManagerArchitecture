//
//  SectionManagerBase.h
//  ArchitectureTemplate
//
//  Created by Jamie on 23/12/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewModel.h"

@class SectionManager;
@protocol SectionManagerDelegate <NSObject>
- (void)sectionManager:(SectionManager *)sectionManager didSelectItemAtIndex:(NSInteger)index;
@end


@interface SectionManager : NSObject
@property (nonatomic, weak) id<SectionManagerDelegate>delegate;
@property (nonatomic, strong) ViewModel *viewModel;
@property (nonatomic, strong) UICollectionView *collectionView;

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView viewModel:(ViewModel *)viewModel;

- (NSInteger)numberOfItems;

- (CGSize)sizeForItemAtIndex:(NSInteger)index;

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath;

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section;

- (void)didSelectItemAtIndex:(NSInteger)index;

@end
