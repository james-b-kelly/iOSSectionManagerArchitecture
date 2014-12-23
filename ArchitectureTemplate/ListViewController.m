//
//  ListViewController.m
//  ArchitectureTemplate
//
//  Created by Jamie on 23/12/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import "ListViewController.h"
#import "ListViewModel.h"
#import "SectionManagerProtocol.h"
#import "ListMainSectionManger.h"
#import "ListSecondarySectionManager.h"

@interface ListViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, ViewModelDelegate>
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) ListViewModel *viewModel;
@property (nonatomic, strong) NSArray *sectionManagers;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[ListViewModel alloc] init];
    [self loadSectionManagers];
}

- (void)loadSectionManagers {
    ListMainSectionManger *mainSectionManager = [[ListMainSectionManger alloc] initWithCollectionView:self.collectionView viewModel:self.viewModel];
    ListSecondarySectionManager *secondarySectionManager = [[ListSecondarySectionManager alloc] initWithCollectionView:self.collectionView viewModel:self.viewModel];
    self.sectionManagers = @[mainSectionManager, secondarySectionManager];
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDatasource/Delegate.

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sectionManagers.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    id<SectionManagerProtocol>sectionManager = self.sectionManagers[indexPath.section];
    return [sectionManager sizeForItemAtIndex:indexPath.row];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    id<SectionManagerProtocol>sectionManager = self.sectionManagers[section];
    return [sectionManager numberOfItems];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    id<SectionManagerProtocol>sectionManager = self.sectionManagers[indexPath.section];
    return [sectionManager cellForIndex:indexPath.row];
}

#pragma mark - ViewModelDelegate

- (void)viewModelDidUpdateData:(id<ViewModelProtocol>)viewModel {
    [self.collectionView reloadData];
}

@end
