//
//  ListViewController.m
//  ArchitectureTemplate
//
//  Created by Jamie on 23/12/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import "ListViewController.h"
#import "ListViewModel.h"
#import "ListPrimarySectionManager.h"
#import "ListSecondarySectionManager.h"

#import "DetailViewModel.h"
#import "DetailViewController.h"

@interface ListViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, ViewModelBaseDelegate, SectionManagerDelegate>
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) ListViewModel *viewModel;
@property (nonatomic, strong) NSArray *sectionManagers;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[ListViewModel alloc] init];
    [self.viewModel loadData];
    [self loadSectionManagers];
}

- (void)loadSectionManagers {
    ListPrimarySectionManager *mainSectionManager = [[ListPrimarySectionManager alloc] initWithCollectionView:self.collectionView
                                                                                            viewModel:(ViewModel *)self.viewModel];
    
    ListSecondarySectionManager *secondarySectionManager = [[ListSecondarySectionManager alloc] initWithCollectionView:self.collectionView
                                                                                                             viewModel:(ViewModel *)self.viewModel];
    mainSectionManager.delegate = self;
    secondarySectionManager.delegate = self;
    self.sectionManagers = @[mainSectionManager,
                             secondarySectionManager];
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDatasource/Delegate.

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sectionManagers.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    SectionManager *sectionManager = self.sectionManagers[indexPath.section];
    return [sectionManager sizeForItemAtIndex:indexPath.row];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    SectionManager *sectionManager = self.sectionManagers[section];
    return [sectionManager numberOfItems];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SectionManager *sectionManager = self.sectionManagers[indexPath.section];
    return [sectionManager collectionView:collectionView cellForItemAtIndexPath:indexPath];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    SectionManager *sectionManager = self.sectionManagers[section];
    return [sectionManager collectionView:collectionView layout:collectionViewLayout insetForSectionAtIndex:section];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    SectionManager *sectionManager = self.sectionManagers[indexPath.section];
    [sectionManager didSelectItemAtIndex:indexPath.row];
}

#pragma mark - ViewModelDelegate.

- (void)viewModelDidUpdateData:(ViewModel *)viewModel {
    [self.collectionView reloadData];
}

#pragma mark - SectionManagerDelegate.

- (void)sectionManager:(SectionManager *)sectionManager didSelectItemAtIndex:(NSInteger)index {
    NSDictionary *dict;
    if ([sectionManager isKindOfClass:[ListPrimarySectionManager class]]) {
        dict = [self.viewModel primaryItemAtIndex:index];
    }
    else {
        dict = [self.viewModel secondaryItemAtIndex:index];
    }
    DetailViewModel *viewModel = [[DetailViewModel alloc] initWithItem:dict];
    DetailViewController *viewController = [[DetailViewController alloc] initWithViewModel:viewModel];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
