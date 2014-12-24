//
//  ListSecondarySectionManager.m
//  ArchitectureTemplate
//
//  Created by Jamie on 23/12/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import "ListSecondarySectionManager.h"
#import "ListViewModel.h"
#import "SecondaryCollectionViewCell.h"

@interface ListSecondarySectionManager()
@property (nonatomic, strong) ListViewModel *viewModel;
@end

@implementation ListSecondarySectionManager
@synthesize viewModel = _viewModel, collectionView = _collectionView;

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
                             viewModel:(ViewModel *)viewModel {
    if (self = [super init]) {
        _viewModel = (ListViewModel *)viewModel;
        _collectionView = collectionView;
        
        UINib *cellNib = [UINib nibWithNibName:NSStringFromClass([SecondaryCollectionViewCell class]) bundle:nil];
        [_collectionView registerNib:cellNib forCellWithReuseIdentifier:SecondaryCollectionViewCellID];
    }
    return self;
}

- (NSInteger)numberOfItems {
    return self.viewModel.numberOfSecondaryItems;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(CGRectGetWidth(self.collectionView.frame), 88.0);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SecondaryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SecondaryCollectionViewCellID forIndexPath:indexPath];
    cell.label.text = [self.viewModel titleForSecondaryItemAtIndex:indexPath.row];
    return cell;
}

@end
