//
//  SectionManagerBase.m
//  ArchitectureTemplate
//
//  Created by Jamie on 23/12/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import "SectionManager.h"

@implementation SectionManager

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView viewModel:(ViewModel *)viewModel {
    if (self = [super init]) {
        //override in subclass.
    }
    return self;
}

- (NSInteger)numberOfItems {
    //override in subclass.
    return 0;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    //override in subclass.
    return CGSizeZero;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //override in subclass.
    return nil;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    //override in subclass.
    return UIEdgeInsetsMake(10, 0, 0, 0);
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    //Override in subclass.
    if ([self.delegate respondsToSelector:@selector(sectionManager:didSelectItemAtIndex:)]) {
        [self.delegate sectionManager:self didSelectItemAtIndex:index];
    }
}

@end
