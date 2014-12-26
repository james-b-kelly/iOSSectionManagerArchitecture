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
 *  As stated in ViewModel.h, we do not pass out our object models directly to clients of the view model.
 *  This is the exception - we expose our objects for the view controller client to build a view model
 *  to pass to another view controller.  
 *  If you don't want to do this you could have your view models build required view models for passing to other
 *  classes instead.  This would probably done on a class-by-class basis (rather than being implemented in this
 *  superclass) such as giving this ListViewModel class a method like
 *  - (DetailViewModel *)detailViewModelForItemAtIndex:(NSInteger)index;
 *  That way you would never have to expose the item class to your VCs, but your view models would then have to
 *  know something about each other (in this case ListViewModel would know about DetailViewModel).
 */
- (id)primaryItemAtIndex:(NSInteger)index;
- (id)secondaryItemAtIndex:(NSInteger)index;

@end
