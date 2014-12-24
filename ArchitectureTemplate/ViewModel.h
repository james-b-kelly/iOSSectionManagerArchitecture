//
//  ViewModel.h
//  ArchitectureTemplate
//
//  Created by Jamie on 23/12/14.
//  Copyright (c) 2014 James Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ViewModel;
@protocol ViewModelBaseDelegate <NSObject>

- (void)viewModelDidUpdateData:(ViewModel *)viewModel;

@end

@interface ViewModel : NSObject
@property (nonatomic, weak) id<ViewModelBaseDelegate>delegate;
- (void)loadData;


/**
 *  Just a convenience method to call in your subclass instead of wrapping your 
 *  calls to viewModelDidUpateData with a check for responding to that selector each time.
 */
- (void)notifyDelegateViewModelDidUpdate;

@end
