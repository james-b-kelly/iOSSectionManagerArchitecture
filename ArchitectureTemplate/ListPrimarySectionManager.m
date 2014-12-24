//
//  ListPrimarySectionManger.m
//  ArchitectureTemplate
//
//  Created by Jamie on 23/12/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import "ListPrimarySectionManager.h"
#import "PrimaryCollectionViewCell.h"
#import "ListViewModel.h"

@interface ListPrimarySectionManager()
@property (nonatomic, strong) ListViewModel *viewModel;
@end

@implementation ListPrimarySectionManager
@synthesize collectionView = _collectionView, viewModel = _viewModel;

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
                             viewModel:(ViewModel *)viewModel {
    if (self = [super init]) {
        _viewModel = (ListViewModel *)viewModel;
        _collectionView = collectionView;
        
        UINib *cellNib = [UINib nibWithNibName:NSStringFromClass([PrimaryCollectionViewCell class]) bundle:nil];
        [_collectionView registerNib:cellNib forCellWithReuseIdentifier:PrimaryCollectionViewCellID];
    }
    return self;
}

- (NSInteger)numberOfItems {
    return self.viewModel.numberOfPrimaryItems;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(CGRectGetWidth(self.collectionView.frame), 44.0);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PrimaryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PrimaryCollectionViewCellID forIndexPath:indexPath];
    cell.titleLabel.text = [self.viewModel titleForPrimaryItemAtIndex:indexPath.row];
    return cell;
}

@end    