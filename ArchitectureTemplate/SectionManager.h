//
//  SectionManagerBase.h
//  ArchitectureTemplate
//
//  Created by Jamie on 23/12/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewModel.h"

/**
 *  Section Manager.
 *  All your section managers will be subclassed from this class.
 *  The responsibility of the Section Manager is to respond to UICollectionView related methods
 *  for a given section of that collection view.
 *  A view controller will have an array of section managers and will pass certain UICollectionViewDelegate/Datasource
 *  and UICollectionViewDelegateFlowLayout methods through to the appropriate one.
 *  Note that this class doesn't actually conform to those UICollectionView protocols (it could, but it's not really
 *  necessary).
 */


@class SectionManager;
@protocol SectionManagerDelegate <NSObject>

- (void)sectionManager:(SectionManager *)sectionManager didSelectItemAtIndex:(NSInteger)index;

@end


@interface SectionManager : NSObject

@property (nonatomic, weak) id<SectionManagerDelegate>delegate;

/**
 *  The view controller which contains this section manager will initialize it with its own view model.
 *  i.e. view controllers and their section managers reference the same view model.
 *  The section manager needs to know about its UICollectionView because it has to register cell/view nibs with it.
 */
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView viewModel:(ViewModel *)viewModel;

@property (nonatomic, strong) ViewModel *viewModel;

@property (nonatomic, strong) UICollectionView *collectionView;

- (NSInteger)numberOfItems;

- (CGSize)sizeForItemAtIndex:(NSInteger)index;

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath;

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section;

- (void)didSelectItemAtIndex:(NSInteger)index;

@end
