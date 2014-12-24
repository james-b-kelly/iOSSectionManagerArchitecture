//
//  ListViewModel.h
//  ArchitectureTemplate
//
//  Created by Jamie on 23/12/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewModel.h"

/**
 *  Example of a view model subclassed from ViewModel.
 */

@interface ListViewModel : ViewModel

@property (nonatomic, readonly) NSInteger numberOfPrimaryItems;
- (NSString *)titleForPrimaryItemAtIndex:(NSInteger)index;

@property (nonatomic, readonly) NSInteger numberOfSecondaryItems;
- (NSString *)titleForSecondaryItemAtIndex:(NSInteger)index;

/**
 *  As stated in
 *
 */
- (id)primaryItemAtIndex:(NSInteger)index;
- (id)secondaryItemAtIndex:(NSInteger)index;

@end
