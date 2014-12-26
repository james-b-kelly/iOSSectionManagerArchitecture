//
//  DetailViewController.m
//  ArchitectureTemplate
//
//  Created by Kelly, James | Jamie | SDTD on 12/24/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailViewModel.h"
#import "DetailBasicInfoSectionManager.h"
#import "DetailExtraInfoSectionManager.h"

@interface DetailViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) DetailViewModel *viewModel;
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *sectionManagers;
@end

@implementation DetailViewController

- (instancetype)initWithViewModel:(DetailViewModel *)viewModel {
    if (self = [super initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]]) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.viewModel loadData];
    [self loadSectionManagers];
}

- (void)loadSectionManagers {
    DetailBasicInfoSectionManager *basicInfoSectionManager = [[DetailBasicInfoSectionManager alloc] initWithCollectionView:self.collectionView viewModel:self.viewModel];
    DetailExtraInfoSectionManager *extraInfoSectionManager = [[DetailExtraInfoSectionManager alloc] initWithCollectionView:self.collectionView viewModel:self.viewModel];
    self.sectionManagers = @[basicInfoSectionManager,
                             extraInfoSectionManager];
    [self.collectionView reloadData];
}


#pragma mark - UICollectionViewDelegate/Datasource/DelegateFlowLayout.

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sectionManagers.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    SectionManager *sectionManager = self.sectionManagers[section];
    return sectionManager.numberOfItems;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    SectionManager *sectionManager = self.sectionManagers[indexPath.section];
    return [sectionManager sizeForItemAtIndex:indexPath.row];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SectionManager *sectionManager = self.sectionManagers[indexPath.section];
    return [sectionManager collectionView:collectionView cellForItemAtIndexPath:indexPath];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    SectionManager *sectionManager = self.sectionManagers[section];
    return [sectionManager collectionView:collectionView layout:collectionViewLayout insetForSectionAtIndex:section];
}

@end
