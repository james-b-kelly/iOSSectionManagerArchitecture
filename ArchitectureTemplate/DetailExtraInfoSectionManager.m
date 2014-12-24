//
//  DetailExtraInfoSectionManager.m
//  ArchitectureTemplate
//
//  Created by Kelly, James | Jamie | SDTD on 12/24/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import "DetailExtraInfoSectionManager.h"
#import "DetailViewModel.h"
#import "DetailCollectionViewCell.h"

@interface DetailExtraInfoSectionManager()
@property (nonatomic, strong) DetailViewModel *viewModel;
@end

@implementation DetailExtraInfoSectionManager
@synthesize viewModel = _viewModel, collectionView = _collectionView;

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView viewModel:(ViewModel *)viewModel {
    if (self = [super init]) {
        _viewModel = (DetailViewModel *)viewModel;
        _collectionView = collectionView;
        
        UINib *cellNib = [UINib nibWithNibName:NSStringFromClass([DetailCollectionViewCell class]) bundle:nil];
        [_collectionView registerNib:cellNib forCellWithReuseIdentifier:DetailCollectionViewCellID];
    }
    return self;
}

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(CGRectGetWidth(self.collectionView.frame), 44);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DetailCollectionViewCellID forIndexPath:indexPath];
    cell.titleLabel.text = self.viewModel.itemDescription;
    return cell;
}

@end
